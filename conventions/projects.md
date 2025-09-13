# Project Conventions & AI Assistant Instructions

## 1. Objective

You are an AI coding assistant tasked with implementing features for this project. Your primary goal is to write clean, maintainable, and well-structured code that adheres to the conventions and patterns established in this document and the existing codebase.

## 2. Core Principles

*   **Clarity over Cleverness:** Favor readable and explicit code over concise but obscure implementations.
*   **Consistency:** Match the style and patterns you find in the existing code. If you are starting a new project, adhere to the common community standards for the given technology stack.
*   **Modularity:** Break down logic into focused functions, components, or modules with single responsibilities.
*   **Minimal Scope:** Only change what is necessary to complete the given task. Avoid unnecessary refactoring of unrelated code unless it is a stated requirement.

## 3. Technical Conventions

### 3.1. Language & Framework

*(This section will be filled in per-project. Example below)*
*   **Primary Language:** [e.g., TypeScript, Python, Rust]
*   **Framework:** [e.g., React, Next.js, Django]
*   **Styling:** [e.g., Tailwind CSS, CSS Modules, Styled Components]

### 3.2. Code Style

*   **Formatting:** Code must be formatted. Use the project's linter (e.g., ESLint, Ruff) and formatter (e.g., Prettier, Black) if present. If not, use standard community style guides.
*   **Naming:**
    *   **Variables & Functions:** Use `camelCase`.
    *   **Components:** Use `PascalCase`.
    *   **Constants:** Use `UPPER_SNAKE_CASE`.
    *   **Files:** Use `kebab-case` for most files; use `PascalCase` for React components.
*   **Imports:** Group and order imports logically (e.g., built-in libraries, third-party packages, internal modules). Use absolute imports (`@/components/...`) if the project is configured for them.

### 3.3. Documentation

*   **Comments:** Explain *why* something is done, not *what* is done. Comment complex algorithms or non-obvious business logic.
*   **JSDoc/Type Annotations:** Provide detailed type annotations for functions and components, especially for complex parameters and return values.
*   **READMEs:** If you create a new significant module or directory, add a brief `README.md` explaining its purpose and usage.

## 4. Interaction Protocol

1.  **Task Source:** You will receive tasks from a `todo.md` list. Execute them in the specified order.
2.  **Scope:** Focus exclusively on the current task. Do not implement future tasks or features unless they are a strict dependency for the current one.
3.  **Output:**
    *   Write all code directly into the correct files in the project structure.
    *   After completing a task, mark it as done in the `todo.md` list by prefixing it with `[x]`.
    *   **Do not** output the entire code of a large file. Only show the relevant diff or the new code you have written.
    *   If you encounter an error or ambiguity, state the problem clearly and wait for instruction before proceeding.
4.  **Testing:** If the project has an existing testing framework (e.g., Jest, Vitest, Pytest), write unit tests for new non-trivial functions and components. Place tests in the corresponding `__tests__` or `tests` directory.

## 5. Project Context

The full Product Requirements Document (PRD) is available in `projectRequirements.md`. Refer to it to understand the broader goals and user stories guiding your implementation. Your code should align with the product vision described there.

**Proceed by reading the `todo.md` list and executing the first available task.**
