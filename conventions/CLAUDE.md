# CLAUDE.md - Project Conventions & AI Assistant Instructions

## Objective

You are an AI coding assistant implementing features for this project. Your goal is to write clean, maintainable code following established conventions and patterns.

## Core Principles

- **Clarity over Cleverness:** Favor readable code over obscure implementations
- **Consistency:** Match existing code style and patterns
- **Modularity:** Create focused functions/components with single responsibilities
- **Minimal Scope:** Only change what's necessary for the task
- **YAGNI & KISS:** Strictly follow requirements, don't over-engineer

## Code Style & Structure

### General

- Use project's linter/formatter if present, otherwise use community standards
- Comments explain _why_ not _what_
- Group imports logically: built-in → third-party → internal
- Use absolute imports (`@/...`) if configured

### Naming Conventions

- Variables & Functions: `lower_snake_case`
- Components: `PascalCase`
- Constants: `UPPER_SNAKE_CASE`
- Files: `kebab-case` (use `PascalCase` for React components)

### Documentation

- Provide detailed type annotations for functions/components
- Add README.md for significant new modules
- Document complex algorithms and business logic

## Python Conventions

- Use standard Python type hints (PEP 484) for all function arguments and return values
- Prefer functional constructs (list comprehensions, generators, map/filter) over raw loops
- Use descriptive variable names with auxiliary verbs
- Functions and classes should have NumPy docstrings standard
- Use match...case instead of complex if...elif...else statements
- For refactoring: break into small steps, make minimal changes, maintain identical behavior

### Exception Handling

- Catch specific exceptions, not broad `except Exception:`
- Use `try/except/else/finally` blocks or context managers
- Raise custom exception classes inheriting from `Exception` (suffix with `Error`)
- Log errors with context before re-raising or handling
- Never swallow exceptions silently without explaining why

### Python Libraries

- Prefer polars over pandas for data analysis
- Use pathlib for filesystem paths
- Use @dataclass decorator for data-storing classes
- Use uv for dependency management (not pip)
- Use tomllib module for .toml file interactions

## Git Commit Standards

Follow semantic commit messages:

```
<type>[scope]: <description>

[optional body]

[optional footer]
```

**Types:** feat, fix, docs, style, refactor, perf, test, build, ci, chore, revert

**Guidelines:**

- Description: imperative, lowercase, no period, ≤50 chars
- Body: explain WHY not HOW, wrap at 72 chars
- Footer: reference issues (`Fixes #123`), breaking changes (`BREAKING CHANGE:`)
- Commits should be atomic and specific
- Use `git commit -m "message"` directly, never separate draft files

## Interaction Protocol

1. Execute tasks from todo.md in specified order
2. Focus exclusively on current task, don't implement future features
3. Write code directly to correct files
4. Mark completed tasks with `[x]` in todo.md
5. Write tests for non-trivial new functions if testing framework exists
6. If encountering errors/ambiguities, state problem clearly and wait for instruction
