# Testing Pyramid & Fail Fast, Fail Cheap Rules (테스트 및 검증 규약)

**Activation:** This rule is **ALWAYS ON** for all code changes, testing, and CI/CD operations.

## 1. 핵심 철학: Fail Fast, Fail Cheap

소프트웨어 품질 검증 시 발생하는 시간 지연과 자원(컴퓨팅, 클라우드 비용, LLM 토큰) 소모를 최소화하기 위해 다음 두 원칙을 반드시 준수합니다:

- **Fail Fast (가장 빠른 피드백):** 결함이 발생했을 때 수 초 내에 실패를 즉시 감지하여 개발자와 에이전트가 지체 없이 원인을 수정할 수 있도록 합니다.
- **Fail Cheap (최소 비용 탐지):** 비용이 0원에 가까운 정적 검증부터 시작하여, 검증 단계를 통과할 때마다 점진적으로 더 무거운 테스트를 수행합니다. 앞 단계가 실패하면 뒷 단계는 절대 실행하지 않습니다.

---

## 2. 테스트 피라미드 및 계층별 검증 순서 (Test Tiering)

모든 로컬 검증, PR 전 검증, CI 파이프라인은 아래의 엄격한 순서(Tier 0 → Tier 4)를 준수합니다.

| Tier | 검증 단계 | 소요 시간 기준 | 주요 대상 및 특징 | 비용 수준 |
| :---: | :--- | :---: | :--- | :---: |
| **Tier 0** | 코드 스타일 & 린트 | < 5초 | Markdownlint, Prettier, ESLint, Flake8 | Free (0원) |
| **Tier 1** | 정적 타입 검사 | < 15초 | TypeScript (`tsc --noEmit`), Mypy | Free (0원) |
| **Tier 2** | 순수 단위 테스트 & Mock 프롬프트 검증 | < 1분 | 외부 I/O 없는 순수 함수, Zod/Pydantic 스키마 검증, Mock LLM | Very Cheap |
| **Tier 3** | 빌드 & 모듈 통합 테스트 | 1 ~ 3분 | Production 번들 빌드, API 계약 및 컴포넌트 통합 테스트 | Moderate |
| **Tier 4** | E2E & 실 LLM 평가 (Eval) | 수분 ~ 수십분 | Playwright 브라우저 테스트, 실 LLM API 벤치마크 (조건부 실행) | Expensive |

---

## 3. 에이전트 행동 지침 (Agent Guidelines)

### 1) 조기 중단 원칙 (Early Bailout)

- 린트나 타입 체크(Tier 0, 1)에서 에러가 발생한 경우, 무거운 단위 테스트나 빌드 명령어를 실행하지 마십시오. 즉시 중단하고 정적 에러부터 해결하십시오.
- 단위 테스트(Tier 2)가 실패하면 빌드(Tier 3)를 시도하지 마십시오.

### 2) 변경 범위 기반 선택적 실행 (Scope-aware Execution)

- 문서(`.md`, `.txt`)나 설정 파일만 변경된 경우, 전체 빌드나 무거운 테스트를 실행하지 마십시오.
- 특정 모듈만 변경된 경우 전체 테스트 스위트 대신 변경된 모듈에 대응하는 단위 테스트(`test --changed` 또는 특정 테스트 파일 지정)를 우선 실행하십시오.

### 3) 단위 테스트 작성 규약 (`/test-writer` 연계)

- 단위 테스트 내에서 실제 네트워크 호출, 데이터베이스 I/O, 디스크 파일 I/O를 직접 수행하지 마십시오 (반드시 Mocking 처리).
- 단위 테스트에 `sleep`이나 인위적인 대기 시간(Timer)을 두는 것을 엄격히 금지합니다.
- 개별 단위 테스트는 실행 시간이 **50ms 미만**으로 유지되어야 합니다.

### 4) AI 프롬프트 및 LLM 기능 검증 규약 (`/prompt` 연계)

- **기본 검증은 100% Mock 기반:** 프롬프트 템플릿 검증, 인젝션 방어 태그 검증, 출력 JSON 스키마 파싱 검증은 실제 LLM API 호출 없이 가상 응답(Mock Response)으로 테스트합니다.
- **유료 모델 API 직접 호출 차단:** 테스트 러너나 CI에서 유료 LLM API를 무제한으로 호출하는 코드를 작성하지 마십시오.
- **평가(Eval)는 조건부 격리:** 실제 모델을 호출하는 대규모 평가 스위트는 CI의 기본 파이프라인에 포함시키지 않고, 별도의 수동 트리거(Manual) 또는 PR 라벨(`run-eval`) 하에서만 실행되도록 격리하십시오.

### 5) 로컬 Git Hook 연계 권장 (Local Zero-Cost Gate)

- 개발자 및 에이전트의 로컬 커밋 단계에서 결함을 0초 내에 포착할 수 있도록, 프로젝트 스택 확정 시 Git Hook(예: Husky + lint-staged, Python pre-commit 등) 연계를 적극 권장합니다.
- 로컬 훅에서는 전체 프로젝트가 아닌 `git diff --cached` 대상 파일에 대해서만 Tier 0(린트/포맷) 및 빠른 Tier 1(타입) 검증을 수행하여 커밋 지연을 최소화합니다.
