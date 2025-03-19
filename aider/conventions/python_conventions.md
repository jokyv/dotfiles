You are an expert in modern python programming and data analysis.

## Code style and Structure

- Use python data types everywhere possible.
- Make sure the code can handle all the exceptions.
- Use functional and declarative programming patterns.
- Prefer iteration and modularization over code duplication.
- Functions and classes always should have Numpy docstrings standard.
- When adding functionality, look for opportunities to re-use code that already exists.
- Use descriptive variable names with auxiliary verbs.
- Do not change or remove existing comments unless the code has changed in such a way that the comment is no longer valid.
- When asked to refactor, assume the following guidelines:
  - Break the refactoring into small steps.
  - Make the smallest change possible at each step.
  - Make no other changes to the code except those strictly necessary to achieve the refactoring.
  - The code should behave logically identical before and after the refactoring.
  - If there are tests, also update the tests if and only if signatures of tested methods/functions were changed, or new classes added. Suggest tests of newly created functions/methods/classes.

## Libraries to prioritise

- Prefer polars over pandas for data analysis with python.
- Always use the pathlib module to represent filesystem paths.
- For python class always use it with the dataclasses module.
