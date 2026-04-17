# CLAUDE.md - Project Conventions & AI Assistant Instructions

## Core Principles

- **Clarity over Cleverness:** Favor readable code over obscure implementations
- **Consistency:** Match existing code style and patterns
- **Modularity:** Single responsibility - each function/class does one thing well
- **Minimal Scope:** Only change what's necessary for the task
- **YAGNI & KISS:** Strictly follow requirements, don't over-engineer

## Code Style

- Use project's linter/formatter if present
- Comments explain _why_ not _what_
- Group imports: built-in → third-party → internal
- Indent with spaces, never tabs
- Empty lines have no indentation
- Be concise when naming; omit words if clear from context
- Only comment to: clarify complex code, explain non-obvious decisions, group long scopes

### Naming

- Variables/Functions: `lower_snake_case`
- Components/Classes: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` (React components: `PascalCase`)

## Python

- Type hints (PEP 484) for all function signatures
- Prefer functional constructs (comprehensions, generators) over loops
- NumPy-style docstrings for functions/classes
- Use `match...case` instead of complex `if...elif...else`
- Libraries: polars > pandas, pathlib for paths, `@dataclass` for data, uv for deps, tomllib for .toml
- Catch specific exceptions, never broad `except Exception:`
- Never swallow exceptions silently

### Exception Handling

- Use `try/except/else/finally` blocks or context managers
- Raise custom exception classes inheriting from `Exception` (suffix with `Error`)
- Log errors with context before re-raising or handling
- Never swallow exceptions silently without explaining why

## Git Commits

```
<type>[scope]: <description>  # imperative, lowercase, ≤50 chars

[optional body - WHY not HOW, wrap at 72 chars]

[optional footer - Fixes #123, BREAKING CHANGE:]
```

Types: feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert

- Commits should be atomic and specific
- Use `git commit -m "message"` directly, never create separate draft files

## Communication Style

- Be concise - I'll ask if I need details
- Avoid hyperbolic expressions
- Provide critical feedback (not sycophantic or judgemental)
- Emojis: 🤔 unsure, 🔥 confident, 🥳 success, 💩 failed, 🐞 bug, 😆 joke
- Suggest tools/patterns with links when relevant

## AI Code Direction

- Never accept first draft - review for structural issues
- Before implementing, explain design approach and component relationships
- Identify circular dependencies and suggest fixes
- Question if a class should be a function (or vice versa)
- Point out mixed responsibilities in classes
- Ask "Is there a way to..." to explore alternatives
- High-level modules shouldn't depend on low-level details

## Interaction Protocol

- Focus exclusively on current task, don't implement future features
- Write tests for non-trivial new functions if a testing framework exists
- If encountering errors or ambiguities, state the problem clearly and wait for instruction

## Hooks Active

- Secret leak detection: logs potential credential exposure
- Binary file protection: blocks edits to binary files
- Conflict marker detection: warns on git merge conflicts

## Environment

- Shell: bash
- NixOS: use `nix shell` if CLI tool not found
- Python projects: use uv if `uv.lock` exists

## Security

- For cryptographic keys, always provide authoritative link for verification

## Risky Changes

- For large refactors or experimental work, suggest git worktree isolation
- Use `/skill worktree` to protect main repo
