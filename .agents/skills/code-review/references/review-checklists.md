# Code Review Checklists (전문 리뷰 체크리스트)

이 문서는 프로젝트의 코드 리뷰 시 검토하는 상세 항목 기준서입니다.

---

## 1. Architecture & Anti-AI-Slop 체크리스트
- [ ] **Single Responsibility**: 함수와 모듈이 단일 책임을 유지하고 불필요하게 비대하지 않은가?
- [ ] **No Generic Slop**: 복사-붙여넣기식 장식용 코드나 불필요한 추상화가 없는가?
- [ ] **Consistency**: 기존 프로젝트의 파일/폴더 명명 규칙 및 패턴을 일관되게 따르는가?

---

## 2. Security & Zero-Trust 체크리스트
- [ ] **Sensitive Data**: API 키, 시크릿, 비밀번호가 하드코딩되거나 커밋되지 않았는가?
- [ ] **Input Validation**: 외부 입력(URL 파라미터, 폼 데이터, API 요청)을 정규식/타입으로 엄격히 검증하는가?
- [ ] **Safe Execution**: `eval`, `innerHTML`, 신뢰할 수 없는 외부 스크립트 실행이 차단되었는가?

---

## 3. Performance & Resource Management 체크리스트
- [ ] **Re-render / Re-compute**: 불필요한 반복 렌더링이나 무거운 계산이 캐싱(`useMemo`, 메모이제이션)되었는가?
- [ ] **Memory Leaks**: 타이머, 이벤트 리스너, 구독 해제가 누락 없이 정리되는가?
- [ ] **Bundle Size**: 불필요하게 무거운 외부 라이브러리를 추가하지 않았는가?

---

## 4. Quality & Type Safety 체크리스트
- [ ] **Type Safety**: `any` 타입 없이 strict 타입 체킹을 통과하는가?
- [ ] **Error Handling**: 비동기 호출 시 try/catch 및 적절한 에러 사용자 피드백이 제공되는가?
- [ ] **Testability**: 비즈니스 로직이 UI와 분리되어 독립적으로 테스트 가능한가?

