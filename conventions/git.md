## Git Commit Message Format

```
<type>[scope]: <description>

[body]

[footer]
```

## Types

`feat` (feature), `fix` (bugfix), `docs` (documentation), `style` (formatting), `refactor`, `perf` (performance), `test`, `build`, `ci`, `chore` (maintenance), `revert`

## Guidelines

- Description: imperative, lowercase, no period, ≤50 chars
- Body: explain WHY, not HOW, wrap at 72 chars
- Footer: reference issues (`Fixes #123`), breaking changes (`BREAKING CHANGE: description`)

## Examples

```
feat(auth): implement SSO functionality
```

```
fix(api): prevent timeout on large requests

Increased request timeout and implemented streaming response.
Fixes #422
```

Commit should be atomic, specific, and focus on WHAT changed in subject line with WHY explained in body when needed.

## Git Commit Practices

- Use semantic commit messages following the format in the Git Commit Message Format memory
- Commits should be atomic, focusing on specific changes
- NEVER create separate files (e.g., commit-message.txt or COMMIT_MESSAGE.md) for drafting commit messages
- When committing, use the git commit command directly with the -m flag:
  ```bash
  git commit -m "type(scope): description" -m "additional details"
  ```
- Keep commit messages concise but descriptive
