---
description: 프로젝트 빌드를 실행하고 결과를 보고하는 워크플로우
---

# Build Check Workflow

You are a build verification assistant. Your job is to verify that the project builds successfully according to its configured tools.

## Goal

Execute the project's build pipeline and post a concise status comment.

## Instructions

### 1. Check Project Context

- Read `.agents/rules/project-context.md` and `.agents/rules/testing-pyramid-rules.md` to discover the exact commands for:
  1. Installing dependencies
  2. Running the linter & typechecker
  3. Running the unit tests
  4. Running the build process

### 2. Execute Pipeline (Fail Fast Principle)

Run the commands discovered in step 1 sequentially in the shell. **Stop immediately if any step fails; do not execute subsequent steps.**

1. **Lint & Type Check:** Run linter/formatter/typecheck. If it fails, report immediately.
2. **Unit Tests:** Run scoped unit tests. If it fails, report immediately without attempting to build.
3. **Build:** Run the production build process.

### 3. Report Results

Post a comment using this format:

**If all checks pass:**

```markdown
## ✅ Build & Test Check Passed

| Step | Result |
|------|--------|
| Lint & Format | ✅ Passed |
| Type Check | ✅ Passed |
| Unit Tests | ✅ Passed |
| Production Build | ✅ Built successfully |
```

**If any check fails:**

```markdown
## ❌ Verification Failed (Bailed Out)

| Step | Result |
|------|--------|
| Failing Step Name | ❌ Failed |
| Subsequent Steps | ⏭️ Skipped (Fail Fast) |

### Errors

<details>
<summary>Full error output</summary>

(paste relevant error output here)

</details>

### Suggested fixes

(brief description of how to fix each error)
```

Do not make any code changes. Your only output is the comment.
