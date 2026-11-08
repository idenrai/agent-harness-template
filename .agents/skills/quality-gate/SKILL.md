---
name: quality-gate
description: 프로젝트 빌드 무결성, 정적 타입 검사(tsc), 린트(ESLint), 단위 테스트 일괄 검증 및 장애 분석을 수행하는 품질 게이트 스킬
---

# Quality Gate (통합 품질 게이트)

**트리거:** `/quality-gate` (커밋 전 전체 빌드 검증, 테스트 스위트 확인, CI 실패 디버깅 시)

이 스킬은 프로젝트의 타입, 린트, 테스트, 번들 빌드를 Fail-Fast 파이프라인으로 일괄 검증하는 런북입니다.

---

## 1. 품질 검증 파이프라인 실행
검증 셸 스크립트를 실행하여 4단계 무결성을 검증합니다:
```bash
./.agents/skills/quality-gate/scripts/verify-all.sh
```

- **1단계 (Type Check)**: TypeScript 컴파일 (`npx tsc --noEmit`)
- **2단계 (Lint)**: 코드 스타일 및 규칙 검사 (`npm run lint`)
- **3단계 (Test)**: 단위 및 회귀 테스트 (`npm test` 또는 `npx vitest run`)
- **4단계 (Build)**: 프로덕션 번들 빌드 (`npm run build`)

---

## 2. 서브에이전트 위임 (옵션)
백그라운드에서 격리된 검증을 수행하고자 할 경우:
`invoke_subagent(TypeName: "quality-guard", Role: "Quality Guard", Prompt: "Run verify-all.sh and analyze any failures")`

