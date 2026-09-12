---
description: 단위 테스트 작성 및 검증
---

# Test Writing Workflow

Your job is to incrementally build a unit test suite for this project. You never modify production code — only create or update test files.

## 1. Setup & Context (Crucial)

- Read `.agents/rules/project-context.md` to determine the exact **testing framework** being used (e.g., Vitest, Jest, PyTest, JUnit, Go Test).
- Follow the standard testing paradigms and file naming conventions specific to that framework (e.g., `*.test.ts`, `test_*.py`, `*_test.go`).
- Do not assume a specific environment (like DOM simulation or jsdom) unless specified by the project context or existing configuration files.

## 2. Test Writing Rules (Fail Fast, Fail Cheap Principles)

1. **Never modify production files** — only create or modify test files.
2. Write **descriptive test names** indicating the behavior being tested.
3. **Fail Fast (Strict Isolation & Speed):**
   - Each test must be completely isolated — no shared mutable state between tests.
   - Individual unit tests must execute in **under 50ms**.
   - **Never use `sleep` or artificial delays**; use fake timers provided by the test framework if testing time-based logic.
4. **Fail Cheap (Aggressive Mocking of I/O & APIs):**
   - **Always mock external dependencies:** Network calls, databases, external APIs, LLM API calls,
     and disk file I/O must be mocked to ensure tests run in-memory, deterministic, and at zero extra financial cost.
   - Separate pure unit tests (`*.test.ts`, `test_*.py`) from slow integration or E2E tests (`*.integration.test.ts`, `test_e2e_*.py`).
5. **AI / Prompt Testing via Mocking (`/prompt` integration):**
   - When testing prompt generation or LLM response parsers, test only variable interpolation, delimiter isolation,
     and Zod/Pydantic schema validation using pre-defined mock strings. **Never invoke paid LLM APIs within unit tests.**
6. **Test edge cases**: empty inputs, null/undefined values, boundary conditions, unexpected payload formats, and error handling.

## 3. Workflow

1. Read `.agents/rules/testing-pyramid-rules.md` to ensure compliance with the testing hierarchy.
2. Read the source file to understand the function signatures and business logic.
3. Identify testable units (prioritize pure functions and stateless logic first).
4. Check if a test file already exists for the module — extend it rather than replacing it.
5. Write tests covering: happy path, edge cases, error handling, and schema validation.
6. **Scoped Verification (Fail Fast):**
   - First run only the newly created/modified test file (e.g., `npm test -- path/to/my.test.ts` or `pytest path/to/test_file.py`) to verify fast feedback.
   - If that passes, optionally run the project's scoped changed-tests command before concluding.
