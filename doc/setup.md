# Setup & Installation

이 문서는 개발 환경 설정 및 설치 과정을 안내하기 위한 템플릿입니다.

프로젝트 시작 시, AI 에이전트에게 이 문서를 프로젝트 환경에 맞게 갱신하도록 지시하세요.

## 1. 사전 요구 사항 (Prerequisites)

- 필요한 런타임 환경 (예: Node.js, Python, Go 등)
- 데이터베이스 설치 및 설정 방법
- 기타 필요한 로컬 도구

## 2. 설치 (Installation)

- 소스 코드 클론 방법
- 의존성 패키지 설치 명령어

## 3. 환경 변수 (Environment Variables)

- `.env.example` 파일 설명
- 필요한 환경 변수 발급 및 설정 방법

## 4. 로컬 서버 실행 (Running Locally)

- 개발 서버 실행 명령어
- 서버 접속 주소 (예: <http://localhost:3000>)

## 5. Testing & Linting (테스트 및 린트)

This project follows the **Fail Fast, Fail Cheap** tiered testing philosophy (`.agents/rules/testing-pyramid-rules.md`).
이 프로젝트는 **Fail Fast, Fail Cheap** 계층형 테스트 철학을 따릅니다.

- **Local Lint & Typecheck:** Quick verification for syntax and types before committing.
  - 커밋 전 빠른 문법 및 타입 검증 명령어.
- **Unit Tests:** Fast, isolated tests (< 50ms per test, mocked external I/O).
  - 외부 I/O가 모킹된 빠른 단위 테스트 명령어.
- **Git Hooks (Recommended):** Setup pre-commit hooks (e.g., Husky, lint-staged) for zero-cost early failure detection.
  - 비용 없는 조기 결함 탐지를 위한 pre-commit 훅 설정 권장.
- **CI Configuration Note:** Remember to update `.github/workflows/ci.yml` (`paths-filter` and environment setup) when finalizing the project stack.
  - 프로젝트 기술 스택 확정 시 `.github/workflows/ci.yml`의 `paths-filter` 및 환경 설정을 프로젝트에 맞게 함께 업데이트하세요.
