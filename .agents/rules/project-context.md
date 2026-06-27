---
trigger: always_on
---

# Instructions for [Project Name]

## Project Overview

[프로젝트에 대한 간단한 설명을 여기에 작성하세요. 목적, 주요 기능, 타겟 사용자 등을 명시합니다.]

---

## Tech Stack

| Area | Technology |
|------|------------|
| Frontend | [e.g. React 19 · TypeScript · Vite] |
| Styling | [e.g. Tailwind CSS] |
| State | [e.g. Zustand] |
| Backend | [e.g. Node.js · Express] |
| Database | [e.g. PostgreSQL · Prisma] |
| Deployment | [e.g. Vercel / AWS] |

---

## Project Structure

```
[프로젝트 이름]/
├── src/                        # 소스 코드 디렉토리
│   ├── components/             # 재사용 가능한 UI 컴포넌트
│   ├── hooks/                  # 커스텀 훅
│   ├── pages/                  # 라우트 페이지
│   ├── stores/                 # 전역 상태 관리
│   ├── types/                  # 타입 정의
│   └── utils/                  # 유틸리티 함수
├── public/                     # 정적 에셋
├── package.json
└── [기타 설정 파일들]
```

---

## How to Build and Run

### Prerequisites

- Node.js [버전] 이상

### Development

```bash
# 의존성 설치
npm install

# 개발 서버 실행
npm run dev
```

---

## Testing

[테스트 실행 방법 및 규칙을 명시하세요. 예: `npm test`]

---

## Coding Conventions

### Language and Types
- 모든 소스 파일은 **TypeScript**를 사용합니다.
- `interface`와 `type`을 일관성 있게 사용하세요.

### Components
- 함수형 컴포넌트와 훅을 사용합니다.
- 컴포넌트 이름은 PascalCase를 사용합니다.

### File and Naming Conventions
- 유틸리티 및 훅: `camelCase.ts`
- 컴포넌트: `PascalCase.tsx`
- 상수: `UPPER_SNAKE_CASE`

### Linting
- 작업 커밋 전에 린트를 실행하고 오류를 수정하세요.