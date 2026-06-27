# AI Agent Harness Template

이 리포지토리는 AI 에이전트(예: Gemini, Claude, Cursor 등)가 프로젝트에 최적화된 방식으로 동작할 수 있도록 규칙(Rules), 워크플로우(Workflows), 스킬(Skills) 및 문서(Doc) 구조를 템플릿화한 것입니다.

새로운 프로젝트를 시작할 때 이 템플릿을 사용하여 강력한 AI Pair Programming 환경을 즉시 구축할 수 있습니다.

## 🚀 시작하기

1. **저장소 생성:** 이 템플릿을 기반으로 새로운 GitHub 리포지토리를 생성합니다. (GitHub의 "Use this template" 버튼 활용)
2. **프로젝트 설정 업데이트:**
   - `AGENTS.md`: 새 프로젝트에 불필요한 규칙/워크플로우/스킬을 제거하고 필요한 내용을 추가하세요.
   - `.agents/rules/project-context.md`: 프로젝트의 기술 스택, 아키텍처, 폴더 구조 등을 실제 내용으로 덮어씁니다.
3. **IDE 설정 연동:**
   - `AGENTS.md`를 단일 진실 공급원(SSoT)으로 사용하도록 `.cursorrules`, `CLAUDE.md`, `GEMINI.md` 등이 설정되어 있습니다.

## 📂 구조 설명

- `.agents/rules/`: 코딩 컨벤션, 아키텍처 지침, 보안 규칙 등 에이전트가 항상 지켜야 할 Core Rules.
- `.agents/workflows/`: 특정 상황(예: `/plan`, `/frontend`, `/review`)에서 에이전트가 수행해야 할 단계별 가이드.
- `.agents/skills/`: 에이전트가 사용할 수 있는 도구 및 확장 기능(프롬프트, 브라우저 제어, UI 디자인 등).
- `.github/`: CI/CD 워크플로우 및 이슈/PR 템플릿.
- `doc/`: 프로젝트 문서화를 위한 기본 디렉토리 구조.

## 💡 활용 팁

- 에이전트에게 `/plan` 워크플로우를 지시하여 코딩 전에 탄탄한 구조 설계를 먼저 받으세요.
- 주기적으로 `.agents/rules/project-context.md`를 업데이트하여 에이전트가 프로젝트의 최신 상태를 인지하도록 하세요.
