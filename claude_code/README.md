# Claude Code Configuration

Universal Claude Code settings, commands, skills, and hooks for use across projects.

## Contents

### Settings

**`settings.json`** — Permissions, hooks, and environment configuration
- Permission allowlist for git, filesystem, search, process commands (read-only safe)
- Denylists for destructive operations
- Pre/post-tool hooks for security, notifications, and session analysis

### Commands

Custom Claude Code commands for workflow automation:

| Command | Purpose |
|---------|---------|
| `work-design-review` | Analyze code changes for design quality, responsibility, dependencies, and abstraction issues |
| `work-git-commit` | Interactive conventional commit assistant with semantic versioning |
| `work-issue` | GitHub issue analyzer — fetch, analyze, and implement GitHub issues |
| `work-maintain` | Periodic codebase maintenance: health checks, cleanup, security scans, reports |
| `work-prime` | Quick project context loader — detect type, structure, git state, and report readiness |
| `work-release-notes` | Generate release notes using git-cliff from conventional commits |
| `work-setup` | Interactive environment setup — detect tools, configure projects, verify installations |
| `work-sync-docs` | Sync CLAUDE.md and docs/ from codebase changes (git-based analysis) |

### Skills

Reusable skills for Claude Code:

| Skill | Purpose |
|-------|---------|
| `python` | Modern Python conventions: uv, polars, pathlib, type hints, comprehensions |
| `session-analysis` | Analyze recent conversations for friction patterns → suggest CLAUDE.md improvements |
| `smart-git-commit` | Auto-commit changes after 30+ minutes with intelligent semantic messages |
| `worktree` | Isolate risky refactors in git worktrees to protect main repo |

### CLAUDE.md

Project-level conventions file with core principles, code style, Python guidelines, git commit format, communication style, and security notes. Referenced by settings hooks.

## Usage

### In nixos-config

Reference these files in `home/programs/claude.nix`:

```nix
{
  programs.claude-code = {
    commands = {
      work-design-review = "/path/to/dot/claude_code/commands/work-design-review.md";
      work-git-commit = "/path/to/dot/claude_code/commands/work-git-commit.md";
      # ... etc
    };

    skills = {
      python = "/path/to/dot/claude_code/skills/python.md";
      session-analysis = "/path/to/dot/claude_code/skills/session-analysis.md";
      # ... etc
    };

    memory.text = builtins.readFile "/path/to/dot/claude_code/CLAUDE.md";
    settings = import ./claude_code/settings.json;
  };
}
```

### Locally per-project

Copy `CLAUDE.md` or `settings.json` into a project's `.claude/` directory to override globally.

## Settings Notes

- **No secrets**: Only includes `API_TIMEOUT_MS`. Keep auth tokens in `~/.claude/settings.local.json`
- **Security hooks**: Detects potential secret leaks, blocks binary edits, warns on merge conflicts
- **Notifications**: Desktop notifications on task completion (supports Linux + macOS)
- **Session reminders**: Suggests `/session-analysis` after 20+ tool uses per week

## Links

- [Main README](../README.md)
- [CLAUDE.md - Project Conventions](CLAUDE.md)
- [settings.json - Permissions & Hooks](settings.json)
