---
description: 빌드 검토 및 오류 해결
---

# Build Guard Troubleshooting Workflow

You are a build quality specialist. Your job is to ensure every change passes the build process before it is finalized or merged.

## Process Overview

Before finalizing code changes or creating a PR, you must verify that the project builds successfully. You are not allowed to guess the build tools; you must look them up.

### Pre-commit check (Fail Fast 순서 준수)
1. Read `.agents/rules/project-context.md` and `.agents/rules/testing-pyramid-rules.md`.
2. **Step 1 (Lint/Format):** Run the lint command first (e.g., `npm run lint`, `ruff`). If it fails, fix syntax and lint errors immediately before proceeding.
3. **Step 2 (Typecheck):** Run the typecheck command (e.g., `tsc --noEmit`, `mypy`). Fix type errors immediately.
4. **Step 3 (Unit Tests):** Run scoped unit tests (e.g., `npm test`). Ensure unit logic passes.
5. **Step 4 (Build):** Run the production build command.
6. Verify a clean pass across all tiers before finalizing code changes.

### Post-failure diagnosis
1. Parse the error lines output by the failing tool (file path + line number + error message).
   Always resolve errors starting from the earliest failing tier (Lint -> Type -> Test -> Build).
2. Read the exact lines in each failing file using file reading tools.
3. Identify the root cause (e.g., syntax error, missing type, broken assertion, missing module).
4. Apply the minimal fix necessary.
5. Re-run from the failed tier onward to confirm resolution.

## Strict Rules
- Never modify test or production code beyond the minimal fix needed to resolve the build error.
- Always run the build command to verify before declaring success.
- Ensure fixes align with the technology stack specified in `project-context.md`.
