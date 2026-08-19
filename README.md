# DALM Frontend

AI 기반 사진 매칭 서비스 **DALM**의 Flutter 프론트엔드 레포지토리입니다.

---

## 🛠 Tech Stack

* **Framework** : Flutter
* **Language** : Dart
* **Architecture** : MVVM

> 상태 관리 및 네트워크 관련 라이브러리는 추후 기술 선정에 따라 추가합니다.

---

## 📂 Project Structure

기능별로 디렉토리를 분리하고 각 기능 내부에서 MVVM 구조를 적용합니다.

```text
lib/
├── main.dart
│
├── core/                   # 앱 전역 공통 기능
│   ├── theme/
│   ├── network/
│   └── utils/
│
├── features/               # 기능별 화면 및 로직
│   ├── onboarding/
│   │   ├── view/
│   │   └── viewmodel/
│   │
│   ├── auth/
│   │   ├── view/
│   │   └── viewmodel/
│   │
│   ├── home/
│   │   ├── view/
│   │   └── viewmodel/
│   │
│   ├── moment/
│   │   ├── view/
│   │   └── viewmodel/
│   │
│   ├── postcard/
│   │   ├── view/
│   │   └── viewmodel/
│   │
│   └── mypage/
│       ├── view/
│       └── viewmodel/
│
└── shared/
    └── widgets/            # 공통 UI 컴포넌트
```

> 프로젝트 구조는 개발 진행 과정에서 변경될 수 있습니다.

---

## 📱 Features

| 기능         | 설명                     |
| ---------- | ---------------------- |
| Onboarding | 앱 소개 및 시작              |
| Auth       | 카카오 로그인, 약관 동의, 프로필 설정 |
| Home       | 오늘의 사진 등록 및 매칭 상태 확인   |
| Moment     | 탐색 중 / 발견 / 지나간 순간 조회  |
| Postcard   | 받은 엽서 / 보낸 엽서 / 엽서 작성  |
| MyPage     | 프로필 및 앱 설정             |

---

## 📖 Convention

### 🌱 Git Branch

* `main` : 배포 브랜치
* `develop` : 개발 브랜치
* `feature/{기능명}` : 새로운 기능 개발을 위한 브랜치

### 💬 Commit Message

| Type       | Description          |
| ---------- | -------------------- |
| `feat`     | 새로운 기능 추가            |
| `fix`      | 버그 수정                |
| `refactor` | 코드 리팩토링              |
| `style`    | 코드 스타일 변경 (기능 변경 없음) |
| `design`   | UI 디자인 변경            |
| `docs`     | 문서 수정                |
| `chore`    | 빌드 및 설정 변경           |
| `test`     | 테스트 코드 작성            |

---

## 📝 Code Convention

| 대상       | 규칙         | 예시                    |
| -------- | ---------- | --------------------- |
| Class    | PascalCase | `HomeViewModel`       |
| Widget   | PascalCase | `MomentCard`          |
| Function | camelCase  | `loadTodayPhoto()`    |
| Variable | camelCase  | `userName`            |
| File     | snake_case | `home_screen.dart`    |
| Folder   | snake_case | `features/onboarding` |
