---
name: backend
description: Develops backend APIs, serverless functions, database interactions, Zero-Trust input validation, and secure business logic.
---

# Backend Engineering

**트리거:** `/backend` (백엔드 아키텍처 설계, API 엔드포인트 구현, 데이터베이스 쿼리 및 보안 로직 구현 시)

이 스킬은 안정적이고 확장 가능한 백엔드 서비스를 구축하기 위한 런북입니다.

---

## 1. 아키텍처 원칙
- **계층 분리**: 컨트롤러(요청 수신), 서비스(비즈니스 로직), 레포지토리(데이터베이스/외부 통신) 계층을 명확히 분리합니다.
- **무상태(Stateless)**: 서버리스 환경을 고려하여 세션 상태를 서버 메모리에 의존하지 않습니다.
- **타임아웃 및 회복력**: 외부 API 호출 시 반드시 타임아웃 가드를 설정합니다.

---

## 2. Zero-Trust 입력 검증 & 보안
- **화이트리스트 검증**: 클라이언트 입력값(Body, Params, Headers)은 스키마(Zod 등) 또는 정규식으로 엄격히 화이트리스트 검증합니다.
- **SQL / NoSQL 인젝션 방어**: 파라미터화된 쿼리 또는 ORM/ODM 안전 메서드를 사용합니다.
- **권한 검증**: 리소스 접근 시 인가(Authorization)를 검증하여 타인의 데이터 접근(IDOR)을 방지합니다.

---

## 3. 에러 처리 및 로깅
- 민감 정보(스택 트레이스, 데이터베이스 오류)를 클라이언트에 그대로 반환하지 않고 정형화된 에러 객체를 전달합니다.

