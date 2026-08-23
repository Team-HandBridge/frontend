# DALM Frontend

서로 다른 사람의 사진에서 우연히 닮은 순간을 발견하고, 한 장의 엽서를 주고받는 AI 사진 매칭 앱의 Flutter 클라이언트입니다.

## 개발 환경

- Flutter 3.47.1 (stable)
- Dart 3.13.1
- Android / iOS
- 앱 이름: `DALM`
- Bundle ID / Application ID: `com.goodshot.dalm`
- 상태 관리 및 의존성 주입: Riverpod
- 구조: Feature-first Clean Architecture + MVVM

Flutter 버전은 `.fvmrc`에 고정합니다. FVM을 사용하지 않는 경우에도 팀원이 동일한 Flutter 버전을 설치해 주세요.

```bash
flutter --version
flutter pub get
flutter run
```

## 프로젝트 구조

```text
lib/
├── app/                         # 앱 진입점, 라우팅, 전역 테마
├── core/                        # 기능에 종속되지 않는 공통 코드
└── features/
    └── photo/                   # 기능별 Clean Architecture 예시
        ├── data/
        │   ├── datasources/
        │   ├── dtos/
        │   ├── mappers/
        │   └── repositories/
        ├── domain/
        │   ├── entities/
        │   ├── repositories/
        │   └── usecases/
        └── presentation/
            ├── states/
            ├── view_models/
            ├── views/
            └── widgets/
```

상세한 레이어 책임과 의존성 규칙은 [docs/architecture.md](docs/architecture.md)를 참고하세요.

## 디자인 시스템

- `DalmPalette`: Figma에서 추출한 원시 색상. 테마 구성 외 화면에서 직접 사용하지 않습니다.
- `DalmColors`: `textPrimary`, `primaryAction`처럼 역할을 나타내는 의미 기반 색상입니다.
- `DalmTypography`: Inter 기반 UI 서체와 Noto Serif KR 기반 감성 문구 스타일입니다.
- 폰트 파일과 라이선스는 `assets/fonts/`에서 관리합니다.

## 브랜치 전략

- `main`: 배포 가능한 안정 버전
- `develop`: 다음 배포를 위한 통합 개발 브랜치
- `feature/{기능명}`: 기능 작업 브랜치. `develop`에서 생성하고 `develop`으로 PR을 보냅니다.

```bash
git switch develop
git pull origin develop
git switch -c feature/photo-upload
```

## 커밋 규칙

| 타입 | 용도 |
| --- | --- |
| `feat` | 새로운 기능 |
| `fix` | 버그 수정 |
| `refactor` | 기능 변화 없는 구조 개선 |
| `design` | UI 및 디자인 변경 |
| `docs` | 문서 변경 |
| `test` | 테스트 추가 또는 수정 |
| `chore` | 빌드, 설정, 의존성 변경 |

예: `feat: 사진 업로드 화면 구현`

## 기본 검증

PR을 올리기 전에 아래 명령을 통과시킵니다.

```bash
dart format --output=none --set-exit-if-changed lib test
flutter analyze
flutter test
```
