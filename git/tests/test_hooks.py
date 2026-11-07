import os
import subprocess
import tempfile
import unittest
from pathlib import Path

HOOKS = Path(__file__).resolve().parents[1] / "hooks"


class HookTests(unittest.TestCase):
    """Exercise shared hooks through local Git operations."""

    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.root = Path(self.temp.name)
        self.home = self.root / "home"
        self.home.mkdir()
        self.repo = self.root / "repo"
        self.remote = self.root / "remote.git"
        self.env = {
            **os.environ,
            "HOME": str(self.home),
            "XDG_CONFIG_HOME": str(self.home / ".config"),
            "GIT_CONFIG_NOSYSTEM": "1",
            "GIT_CONFIG_GLOBAL": str(self.home / "gitconfig"),
        }
        self.git("init", "--bare", str(self.remote), cwd=self.root)
        self.git("init", "-b", "main", str(self.repo), cwd=self.root)
        self.git("config", "user.name", "Test")
        self.git("config", "user.email", "test@example.com")
        self.git("remote", "add", "origin", str(self.remote))
        (self.repo / "tracked").write_text("original\n")
        self.git("add", "tracked")
        self.git("commit", "-m", "initial")

    def git(self, *args, cwd=None, check=True):
        return subprocess.run(
            ["git", *args], cwd=cwd or self.repo, env=self.env, capture_output=True, text=True, check=check
        )

    def trust(self):
        trust = self.home / ".config/git/trusted-repositories"
        trust.parent.mkdir(parents=True, exist_ok=True)
        trust.write_text(str(self.repo.resolve()) + "\n")

    def push(self, *refs):
        return self.git("-c", f"core.hooksPath={HOOKS}", "push", "origin", *(refs or ("main",)), check=False)

    def test_untrusted_repository_is_rejected_before_check_runs(self):
        (self.repo / "check").write_text("#!/bin/sh\ntouch ran\n")
        (self.repo / "check").chmod(0o755)
        result = self.push()
        assert result.returncode != 0
        assert "trust" in result.stderr.lower()
        assert not (self.repo / "ran").exists()
        assert (
            self.git("--git-dir", str(self.remote), "rev-parse", "--verify", "refs/heads/main", check=False).returncode
            != 0
        )

    def test_trusted_missing_or_failing_check_blocks_push(self):
        self.trust()
        result = self.push()
        assert result.returncode != 0
        assert "check" in result.stderr.lower()
        check = self.repo / "check"
        check.write_text("#!/bin/sh\nexit 7\n")
        check.chmod(0o755)
        result = self.push()
        assert result.returncode != 0
        assert "7" in result.stderr
        direct = subprocess.run(
            [str(HOOKS / "pre-push"), "origin", str(self.remote)],
            cwd=self.repo,
            env=self.env,
            capture_output=True,
            text=True,
        )
        assert direct.returncode == 7
        assert (
            self.git("--git-dir", str(self.remote), "rev-parse", "--verify", "refs/heads/main", check=False).returncode
            != 0
        )

    def test_passing_check_runs_once_for_multiple_refs(self):
        self.trust()
        check = self.repo / "check"
        check.write_text(f"#!/bin/sh\nprintf x >> '{self.root / 'runs'}'\n")
        check.chmod(0o755)
        self.git("branch", "other")
        result = self.push("main", "other")
        assert result.returncode == 0, result.stderr
        assert (self.root / "runs").read_text() == "x"
        assert (self.repo / "tracked").read_text() == "original\n"
        self.git("--git-dir", str(self.remote), "rev-parse", "--verify", "refs/heads/main")
        self.git("--git-dir", str(self.remote), "rev-parse", "--verify", "refs/heads/other")

    def test_existing_local_pre_push_receives_refs_and_can_block(self):
        self.trust()
        check = self.repo / "check"
        check.write_text("#!/bin/sh\nexit 0\n")
        check.chmod(0o755)
        hook = self.repo / ".git/hooks/pre-push"
        hook.write_text(f"#!/bin/sh\ncat > '{self.root / 'refs'}'\nexit 3\n")
        hook.chmod(0o755)
        result = self.push()
        assert result.returncode != 0
        assert "refs/heads/main" in (self.root / "refs").read_text()
        assert (
            self.git("--git-dir", str(self.remote), "rev-parse", "--verify", "refs/heads/main", check=False).returncode
            != 0
        )

    def test_pre_commit_framework_hook_is_preserved(self):
        marker = self.root / "framework-ran"
        (self.repo / ".pre-commit-config.yaml").write_text(
            "repos:\n  - repo: local\n    hooks:\n      - id: marker\n        name: marker\n"
            f"        entry: touch {marker}\n        language: system\n"
            "        always_run: true\n        pass_filenames: false\n"
        )
        env = {**self.env, "PRE_COMMIT_HOME": str(self.root / "pre-commit-cache")}
        subprocess.run(["pre-commit", "install"], cwd=self.repo, env=env, capture_output=True, text=True, check=True)
        (self.repo / "tracked").write_text("changed\n")
        self.git("add", "tracked")
        result = subprocess.run(
            ["git", "-c", f"core.hooksPath={HOOKS}", "commit", "-m", "next"],
            cwd=self.repo,
            env=env,
            capture_output=True,
            text=True,
        )
        assert result.returncode == 0, result.stderr
        assert marker.exists()

    def test_existing_local_pre_commit_hook_is_preserved(self):
        hook = self.repo / ".git/hooks/pre-commit"
        hook.write_text(f"#!/bin/sh\ntouch '{self.root / 'commit-hook-ran'}'\n")
        hook.chmod(0o755)
        (self.repo / "tracked").write_text("changed\n")
        self.git("add", "tracked")
        result = self.git("-c", f"core.hooksPath={HOOKS}", "commit", "-m", "next", check=False)
        assert result.returncode == 0, result.stderr
        assert (self.root / "commit-hook-ran").exists()


if __name__ == "__main__":
    unittest.main()
