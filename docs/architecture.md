# DALM 아키텍처 가이드

DALM은 기능별로 코드를 모으는 Feature-first 구조 안에서 Clean Architecture와 MVVM을 적용합니다. 목적은 파일 수를 늘리는 것이 아니라 UI, 비즈니스 규칙, 외부 데이터의 변경 이유를 분리하는 것입니다.

## 의존성 방향

```text
View → ViewModel → UseCase → Repository(interface)
                              ↑
DataSource → DTO → Mapper → Repository(implementation)
```

`presentation`과 `data`는 `domain`을 바라볼 수 있지만, `domain`은 Flutter UI나 API 구현을 알면 안 됩니다. 서로 다른 기능이 필요하면 다른 기능의 내부 파일을 직접 참조하지 말고 `core` 또는 명시적인 공개 인터페이스로 올립니다.

## 레이어별 책임

### Presentation

- `views`: 화면 배치와 사용자 입력 전달
- `widgets`: 해당 기능에서 재사용하는 작은 UI
- `view_models`: 이벤트 처리, UseCase 호출, 화면 상태 갱신
- `states`: 로딩·성공·실패 등 화면이 렌더링할 상태

View에는 API 호출과 DTO 변환을 작성하지 않습니다. Riverpod Provider는 의존성을 조립하고 ViewModel의 수명과 상태를 관리합니다.

### Domain

- `entities`: 앱의 핵심 개념을 나타내는 순수 모델
- `repositories`: 기능이 필요로 하는 동작의 추상 인터페이스
- `usecases`: 하나의 사용자 목적 또는 재사용되는 비즈니스 규칙

Domain은 JSON 키, HTTP 응답 코드, `BuildContext`, Widget을 알지 않습니다. 단순 전달만 하는 UseCase를 의무적으로 만들 필요는 없지만, 검증·조합·재사용 규칙이 있다면 UseCase로 분리합니다.

### Data

- `datasources`: REST API, 로컬 저장소, 카메라 등 실제 데이터 원천 접근
- `dtos`: 서버 요청·응답 형식과 직렬화
- `mappers`: DTO와 Entity 사이 변환
- `repositories`: Domain Repository 인터페이스의 구현

서버 필드 변경은 DTO와 Mapper에서 흡수해 Presentation까지 퍼지지 않게 합니다.

## 데이터 흐름 예시

```text
JSON 응답
  → PhotoDto
  → PhotoMapper
  → Photo Entity
  → UploadPhotoUseCase
  → PhotoViewModel / PhotoState
  → PhotoView
```

- DTO: `image_url`, nullable 값 등 서버 계약을 그대로 표현
- Entity: `imageUrl`처럼 앱에서 이해하기 좋은 형태와 핵심 규칙 표현
- ViewState: 버튼 활성화, 진행률, 오류 문구처럼 화면 렌더링에 필요한 정보 표현

세 모델은 비슷해 보여도 변경 이유가 다르므로 하나로 합치지 않습니다.

## Riverpod 사용 원칙

1. 전역 객체를 직접 생성하지 않고 Provider에서 조립합니다.
2. View는 Provider를 통해 ViewModel 상태를 구독하고 이벤트만 전달합니다.
3. Repository 구현체는 인터페이스 타입으로 노출해 테스트에서 Fake로 교체할 수 있게 합니다.
4. 일회성 화면 상태는 가능한 `autoDispose`를 사용하고, 유지가 필요한 이유를 코드로 드러냅니다.
5. 네트워크 요청·변환·비즈니스 판단을 Provider 선언 한 곳에 몰아넣지 않습니다.

```dart
final photoRepositoryProvider = Provider<PhotoRepository>((ref) {
  return PhotoRepositoryImpl(ref.watch(photoDataSourceProvider));
});
```

## 기능 추가 순서

1. Figma와 API 명세로 화면 상태 및 데이터 계약을 확인합니다.
2. Entity와 Repository 인터페이스를 정의합니다.
3. DTO, Mapper, DataSource, Repository 구현체를 만듭니다.
4. 필요할 때 UseCase를 추가합니다.
5. ViewState, ViewModel, View를 연결합니다.
6. Domain 단위 테스트와 ViewModel 테스트를 우선 작성하고 핵심 화면 위젯 테스트를 보완합니다.

## 폴더 판단 기준

- 둘 이상의 기능이 실제로 공유하기 전에는 `core`로 올리지 않습니다.
- 기능 전용 컴포넌트는 해당 기능의 `presentation/widgets`에 둡니다.
- API 공통 설정, 오류 타입, 저장소 래퍼처럼 앱 전체에 적용되는 것만 `core`에 둡니다.
- 빈 추상화보다 명확한 책임을 우선하며, 초기 기능인 `photo` 구조를 기준 예제로 사용합니다.
