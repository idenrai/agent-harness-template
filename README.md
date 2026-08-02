# AI Agent Harness Template

This repository is a template designed to provide a highly optimized environment for AI Agents (e.g., Gemini, Claude, Cursor) by establishing a standardized structure for Rules, Workflows, Skills, and documentation.

By using this template when starting a new project, you can instantly set up a powerful AI Pair Programming environment regardless of the technology stack.

## 🚀 Getting Started

> **Prerequisite:** You must have Node.js installed to use `npx` for managing agent skills.

1. **Create Repository:** Create a new GitHub repository based on this template (Use the "Use this template" button on GitHub).
2. **Project Planning & Setup (REQUIRED):**
   - In your newly created repository, you MUST invoke the AI agent with the `/plan` command first. Copy and paste the following engineered prompt to set up your project optimally:
   ```text
   /plan
   System Context: You are an expert software architect assisting in setting up a new project.
   Task Instruction: Let's design the concept and choose the technology stack for a new [Describe your app: e.g., Task Management SaaS].
   Constraints:
   - Use the `technology-stack-blueprint-generator` skill to evaluate and recommend the best tech stack.
   - Suggest 3 options for the frontend, backend, and database based on modern best practices.
   - Wait for my approval before finalizing the choices.
   - Once finalized [Step 1]: Completely rewrite `README.md` as a standard project README (discarding the template instructions). However, you MUST append an "AI Agent Workflows" section at the bottom of the new README, summarizing the custom triggers (e.g., `/backend`, `/database`, `/review`) and the role of `AGENTS.md` so human developers know how to interact with the AI. Also, fully populate `.agents/rules/project-context.md` by replacing all placeholders with the finalized stack.
   - After documentation [Step 2]: Use `npx skills find` to discover relevant agent skills for the chosen stack, and propose a list of skills to install. Wait for my approval.
   - Once I approve the skills [Step 3]: Install them and update `AGENTS.md` to route them appropriately. (Skip if no relevant skills are found).
   ```
   > **Note on Language:** The agent is configured to output artifacts in Korean by default. If you prefer English, ask the agent to change the language strategy in `.agents/rules/language-strategies.md` before running `/plan`.
3. **Add Skills & MCPs:** Visit [skills.sh](https://www.skills.sh/) to find open-source skills that match your project's concept, and add them using the command `npx skills add <package> -y`. 
   > **Tip:** For the best experience, we highly recommend installing the [Context7](https://github.com/context7/mcp-server) and [Sequential Thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking) MCP servers for the `/plan` workflow, and the [GitHub MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/github) for the `/solve-issue`, `/pr`, and `/prune` workflows.
4. **Customize Workflows & Rules:** If your project requires specific rules or workflows (e.g., tailored linting, specific deployment checks), add them to the `.agents/rules` or `.agents/workflows` directories.
5. **Route in AGENTS.md:** Ensure that any newly added rules, workflows, or skills are properly routed and referenced within `AGENTS.md`.
6. **Vibe Coding:** Start your full-fledged AI vibe coding experience!

### 💡 Recommended Workflow Loop

To get the most out of this template, we recommend the following iterative cycle:

1. **Plan & Design:** Use `/plan` to establish and document the task plan.
2. **Implement:** Once approved, instruct the agent to implement the code changes.
3. **Review:** Run `/review` to check the quality and security of the code.
4. **Iterate:** Address any issues raised during the review. (Repeat steps 3-4 if needed)
5. **Pull Request:** Once ready, use `/pr` to safely create an automated PR.
6. **Merge:** Review and merge the PR on GitHub.
7. **Prune:** Clean up your local stale branches by running `/prune`.


## 📂 Structure Overview

- `.agents/rules/`: Core Rules that the agent must always follow, such as coding conventions, architecture guidelines, and security policies.
- `.agents/workflows/`: Step-by-step guides for the agent to execute specific situations (e.g., `/plan`, `/frontend`, `/review`).
- `.agents/skills/`: Tools and extensions available to the agent (e.g., prompt engineering, browser control, UI design).
- `.github/`: CI/CD workflows and Issue/PR templates.
- `doc/`: Default directory structure for project documentation.

---

# AI Agent Harness Template (한국어)

이 리포지토리는 AI 에이전트(예: Gemini, Claude, Cursor 등)가 프로젝트에 최적화된 방식으로 동작할 수 있도록 규칙(Rules), 워크플로우(Workflows), 스킬(Skills) 및 문서 구조를 템플릿화한 것입니다.

새로운 프로젝트를 시작할 때 이 템플릿을 사용하면, 실행 기술 스택에 얽매이지 않고 강력한 AI Pair Programming 환경을 즉시 구축할 수 있습니다.

## 🚀 시작하기

> **사전 요구 사항:** 에이전트 스킬을 관리(`npx` 명령어 사용)하려면 시스템에 Node.js가 설치되어 있어야 합니다.

1. **저장소 생성:** 이 템플릿을 기반으로 새로운 GitHub 리포지토리를 생성합니다. (GitHub의 "Use this template" 버튼 활용)
2. **프로젝트 기획 및 설정 (필수 진행):**
   - 새 리포지토리 상에서 코딩을 시작하기 전, **반드시 AI 에이전트에게 `/plan` 명령을 내려** 새 프로젝트의 컨셉을 설계해야 합니다. 시작 시 아래 프롬프트를 복사하여 붙여넣으면 최적의 설정이 가능합니다:
   ```text
   /plan
   System Context: 당신은 새로운 프로젝트 설정을 돕는 전문 소프트웨어 아키텍트입니다.
   Task Instruction: 새로운 [앱 성격 및 설명: 예, B2B SaaS 대시보드]에 대한 컨셉을 설계하고 기술 스택을 선택해 주세요.
   Constraints:
   - `technology-stack-blueprint-generator` 스킬을 사용하여 최적의 기술 스택을 평가하고 추천해 주세요.
   - 최신 모범 사례를 바탕으로 프론트엔드, 백엔드, 데이터베이스에 대해 각각 3가지 옵션을 제안해 주세요.
   - 최종 결정하기 전에 저의 승인을 기다려 주세요.
   - 확정된 후 [1단계]: 기존 템플릿 안내문은 모두 지우고 새 프로젝트에 맞는 표준 `README.md`로 완전히 덮어써 주십시오. 단, 문서 하단에 "AI Agent Workflows" 섹션을 만들어 이 프로젝트에서 사용 가능한 커스텀 트리거(예: `/backend`, `/database`, `/review` 등)와 `AGENTS.md`의 역할을 휴먼 개발자를 위해 요약해 남겨두십시오. 그리고 `.agents/rules/project-context.md`의 플레이스홀더를 확정된 스택 내용으로 모두 채워주세요.
   - 문서화 완료 후 [2단계]: `npx skills find`를 사용하여 선택된 스택에 적합한 스킬을 탐색한 뒤, 저에게 설치할 스킬 목록을 제안해 주세요. 승인을 기다려 주세요.
   - 스킬 설치를 승인하면 [3단계]: 스킬을 설치하고 `AGENTS.md`에 라우팅 규칙을 추가해 주세요. (적합한 스킬이 없다면 이 단계는 생략합니다.)
   ```
3. **스킬 및 MCP 추가:** [skills.sh](https://www.skills.sh/)에서 프로젝트 컨셉에 맞는 오픈소스 에이전트 스킬을 탐색하고, `npx skills add <package> -y` 명령어로 추가하세요.
   > **Tip:** 최상의 경험을 위해 클라이언트에 [Context7](https://github.com/context7/mcp-server)과 [Sequential Thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking)(`/plan` 워크플로우용), 그리고 [GitHub MCP Server](https://github.com/modelcontextprotocol/servers/tree/main/src/github)(`/solve-issue`, `/pr`, `/prune` 워크플로우용)를 연동하는 것을 강력히 권장합니다.
4. **사용자 정의 규칙 및 워크플로우 추가:** 프로젝트 전용 규칙이나 워크플로우가 필요하다면 동일한 방식으로 `.agents/` 내에 추가하세요.
5. **AGENTS.md 라우팅:** 새롭게 추가한 규칙, 워크플로우, 스킬이 에이전트에게 인식될 수 있도록 `AGENTS.md`에서 올바르게 라우팅하세요.
6. **바이브 코딩 시작:** AI를 활용한 본격적인 바이브 코딩(Vibe Coding)을 전개하세요!

### 💡 추천 이용 흐름 (Recommended Workflow Loop)

이 템플릿을 가장 효과적으로 활용하기 위해 아래의 작업 사이클을 권장합니다:

1. **기획 및 설계:** `/plan` 명령으로 작업 계획을 수립하고 문서화합니다.
2. **구현:** 계획이 승인되면 에이전트에게 코드 구현을 지시합니다.
3. **리뷰:** `/review` 명령을 통해 작성된 코드의 품질과 보안을 검토받습니다.
4. **대응 (반복):** 리뷰에서 지적된 사항을 수정 및 보완합니다. (필요시 3~4 반복)
5. **PR 생성:** 작업이 완료되면 `/pr` 명령으로 안전하게 자동 PR을 올립니다.
6. **병합 (Merge):** GitHub 등 원격에서 PR을 병합(Merge) 처리합니다.
7. **정리:** `/prune` 명령으로 로컬의 고립된 브랜치를 깨끗하게 정리합니다.


## 📂 구조 설명

- `.agents/rules/`: 코딩 컨벤션, 아키텍처 지침, 보안 규칙 등 에이전트가 항상 지켜야 할 Core Rules.
- `.agents/workflows/`: 특정 상황(예: `/plan`, `/frontend`, `/review`)에서 에이전트가 수행해야 할 단계별 가이드.
- `.agents/skills/`: 에이전트가 사용할 수 있는 도구 및 확장 기능(프롬프트, 브라우저 제어, UI 디자인 등).
- `.github/`: CI/CD 워크플로우 및 이슈/PR 템플릿.
- `doc/`: 프로젝트 문서화를 위한 기본 디렉토리 구조.
