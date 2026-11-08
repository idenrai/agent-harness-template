---
name: pr
description: Automates pull request creation with doc synchronization (.github/doc-map.yml), staged logical commits, and GitHub MCP server integration (create_pull_request, issue closing).
---

# Pull Request Automation (PR 자동화 및 이슈 연동)

**트리거:** `/pr` (작업 완료 후 PR 생성, GitHub 이슈 해결 및 문서 동기화 요청 시)

이 스킬은 작업 완료 후 문서 동기화, 단계적 커밋 분할, 그리고 **GitHub MCP 서버(`github-mcp-server`)** 또는 `gh` CLI를 통한 고품질 PR 생성 프로토콜입니다.

---

## 1. 사전 검증 및 동기화
1. **설계 문서 동기화 (`.github/doc-map.yml`)**:
   - 변경된 파일에 매핑된 `doc/` 문서를 확인하고, 인라인 이중 언어(Bilingual) 또는 최신 명세로 동기화합니다.
2. **품질 게이트 검증**:
   - `./.agents/skills/quality-gate/scripts/verify-all.sh` 100% 통과를 확인합니다.
3. **논리적 커밋 분할 (Conventional Commits)**:
   - 논리적 단위(`feat`, `refactor`, `fix`, `docs`, `chore`)로 분할하여 스테이징 및 커밋합니다.

---

## 2. GitHub MCP 도구 기반 PR 생성
1. **관련 이슈 조회**:
   - `call_mcp_tool(ServerName: "github-mcp-server", ToolName: "get_issue", Arguments: { owner, repo, issue_number })`
2. **원격 푸시**:
   - 현재 작업 브랜치를 푸시합니다 (`git push -u origin <branch-name>`).
3. **Pull Request 생성**:
   - `create_pull_request` MCP 도구를 호출하거나 `gh pr create`를 실행합니다:
     - **제목**: `type(scope): 한국어 설명`
     - **본문**: 개요, 주요 변경사항, 검증 결과를 테이블과 체크리스트로 상세 작성.
     - **이슈 종결**: 본문 하단에 `Closes #<이슈번호>` 명시.

