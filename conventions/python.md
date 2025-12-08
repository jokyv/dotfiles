You are an expert in modern python programming and data analysis.

## Code style and Structure

- Use standard Python type hints (PEP 484) for all function arguments and return values.
- Prefer functional constructs (list comprehensions, generators, map/filter) over raw loops where appropriate.
- Prefer iteration and modularization over code duplication.
- Functions and classes always should have Numpy docstrings standard.
- When you have a complex if...elif...else statement use match...case instead.
- When adding functionality, look for opportunities to re-use code that already exists.
- Use descriptive variable names with auxiliary verbs.
- Do not change or remove existing comments unless the code has changed in such a way that the comment is no longer valid.
- To prevent SQL injection, always use the database client\'s built-in query parameterization feature instead of using string formatting to insert variables into SQL queries.
- When asked to refactor, assume the following guidelines:
  - Break the refactoring into small steps.
  - Make the smallest change possible at each step.
  - Make no other changes to the code except those strictly necessary to achieve the refactoring.
  - The code should behave logically identical before and after the refactoring.
  - If there are tests, also update the tests if and only if signatures of tested methods/functions were changed, or new classes added. Suggest tests of newly created functions/methods/classes.

## Exception Handling

- Catch specific exceptions rather than using broad `except Exception:` clauses.
- Use `try/except/else/finally` blocks to ensure resources are cleaned up (or use context managers).
- Raise custom exception classes for domain-specific errors rather than generic runtime errors.
- Define custom exceptions by inheriting from the built-in `Exception` class and suffixing the name with `Error` (e.g., `ConfigurationError`).
- When catching exceptions, log the error with context before re-raising or handling it gracefully.
- Never swallow exceptions silently; if an exception is ignored, explicitly comment _why_ it is safe to do so.

## Libraries to prioritise for python code

- Prefer polars over pandas for data analysis with python.
- Always use the pathlib module to represent filesystem paths.
- Use the @dataclass decorator for classes that primarily store data.
- Use uv for Python environment dependency management. Do not use pip directly.
- Do not attempt to edit pyproject.toml: its contents are managed by the uv command.
- If you need to interact with .toml files always use tomllib module.

## AI Assistant Menu

Follow these additional commands when provided by the user.

USER MENU:

- /compact = summarize the current chat history and tasks and what's next.
