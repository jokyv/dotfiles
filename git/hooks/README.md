# Shared Git hooks

The shared `pre-push` hook runs an executable `check` at the root of explicitly trusted repositories. A missing trust entry, missing or non-executable check, or failed check blocks the push. The check runs once per push, from the repository root, with stdin closed. It must not modify tracked files, commit, or push. Other shared hooks delegate to executable hooks in the repository's normal Git common-directory `hooks/` directory. The shared pre-push hook delegates to a local pre-push hook after validation and preserves its arguments and stdin.

## Test

Requires Git, Python 3, Bash, and the `pre-commit` command. Tests use temporary repositories and do not alter Git configuration:

```bash
python3 -m unittest discover -s ~/dot/git/tests -q
```

## Install and enroll

On the NixOS setup, Home Manager configures `core.hooksPath` in `~/nixos-config/home/programs/git.nix`; apply changes with `just home` from `~/nixos-config`. For other setups, installation can be done manually as shown below. Before setting `core.hooksPath`, inspect existing global and local values and hooks. A repository-specific `core.hooksPath` overrides the global value and will not use this dispatcher. Global hook configuration can also replace other hooks, so inspect the supported hook names in this directory and any existing custom hook paths before changing it. In particular, special `fsmonitor-watchman` and `proc-receive` protocols are not provided by this dispatcher.

```bash
# Inspect existing settings before installing.
git config --show-origin --get-all core.hooksPath || true

# After reviewing the impact, install the shared hooks.
git config --global core.hooksPath "$HOME/dot/git/hooks"

# From a repository you explicitly trust, add its physical root to the local list.
mkdir -p "${XDG_CONFIG_HOME:-$HOME/.config}/git"
repo=$(cd "$(git rev-parse --show-toplevel)" && pwd -P)
printf '%s\n' "$repo" >> "${XDG_CONFIG_HOME:-$HOME/.config}/git/trusted-repositories"
```

The list contains one absolute physical repository path per line; paths containing newlines are unsupported. To revoke trust, remove the corresponding line. The trust list is local and is not part of this repository. Trust authorizes the code currently at that path, so recheck trust if a repository is replaced or its check changes. For this scripts repository, install its development dependencies and run `~/scripts/check` directly as described in its README before enrolling it.

These hooks are local safeguards, not remote enforcement. Git supports `git push --no-verify`, and local configuration or a different machine can bypass the shared hook. Do not use the hook as a sandbox against code running under the same user account.

To uninstall on the NixOS setup, remove the `hooksPath` setting from `~/nixos-config/home/programs/git.nix` and run `just home`. For a manual installation, restore the previous global `core.hooksPath` value if there was one; otherwise run `git config --global --unset core.hooksPath`. This does not remove trust entries.
