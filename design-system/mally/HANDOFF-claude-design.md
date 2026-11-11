# 맬리 디자인 시스템 다시 만들기: Claude Design 핸드오프

이 문서를 Claude Design에 그대로 붙여 넣고 시작하세요. 지금 있는 디자인 시스템의 **규칙과 토큰 이름은 유지**하고, **보이는 디자인 완성도를 새로 끌어올리는 것**이 목표예요.

---

## 1. 무엇을 만드나

맬리는 어르신이 매일 조금씩 두뇌 건강을 챙기는 앱(치매 예방 훈련)과, 치매안심센터·보건소 담당자가 쓰는 관리자 웹이에요. 이 둘에 같이 쓰는 디자인 시스템을 다시 디자인해 주세요.

| 대상 | 사용자 | 화면 |
|---|---|---|
| 앱 (iOS · 안드로이드 · 모바일 웹) | 60~80대 어르신 | 오늘의 훈련, 성과(기록), 두뇌활동(게임), 내 정보, 가입, 운동·게임·마음 플로우 |
| 관리자 웹 (PC, 1280px 이상) | 센터 담당자 | 참여자 관리, 훈련 현황, 공지 |

## 2. 지금 상태와 아쉬운 점

지금 버전은 기능 점검용으로 만들어져서 규칙은 탄탄하지만 **보이는 완성도가 부족**해요.

- 컴포넌트 미리보기가 단순 나열이라 실제 제품 화면처럼 보이지 않아요.
- 카드·리스트·요약 패널의 위계(무엇이 먼저 보이는지)가 약해요.
- 맬랑이·헬씨 캐릭터를 화면에 넣는 방식이 정해져 있지 않아요(크기 규칙만 있음).
- 관리자 웹은 틀(사이드바 + 표)만 있고 대시보드다운 정보 디자인이 없어요.
- 아이콘 세트가 없어요(화면마다 직접 그린 선 아이콘).
- 참고로 좋다고 한 방향: **토스·카카오뱅크식 회색 바탕 + 테두리 없는 흰 카드**, 4기 개편 프로토타입(https://butblank-oss.github.io/meli.brain/proto-4th/).

## 3. 꼭 지킬 것 (바꾸지 말 것)

**글꼴**
- Pretendard 하나만 써요. 앱, 관리자 웹, 소개서 모두 같아요.

**시니어 기준**
- 글자 크기: 앱 본문 17px, 최소 14px이에요. 관리자 웹은 최소 13px이에요.
- 터치 영역: 48px 이상이에요.
- 대비: 모든 글자 4.5:1 이상이고, 라이트·다크 모두 해당돼요.
- 상태 표시: 색만으로 상태를 말하지 않고, 아이콘이나 글자를 함께 써요.

**색 규칙**
- 한 화면에는 무채색 + 브랜드 초록 1개만 써요. 경고색은 꼭 필요할 때 1개만 더해요.
- 초록은 세 가지 역할만 맡아요.
  - `primary`: 누르는 버튼
  - `text-accent`: 초록 글자
  - `surface-mint`: 선택 표시
- 성공 표시는 별도 초록 없이 체크 아이콘과 "완료" 글자로 해요.
- 면은 회색 바탕(`bg`) 위에 흰 카드(`surface`)를 놓아요. 반투명 유리 효과는 탭바에만 써요.
- 캐릭터 색(노랑·파랑·분홍 등)은 그림 안에서만 쓰고, UI 색으로 가져오지 않아요.

**브랜드 원색** (덱 기준 원본 값이라 바꾸지 말 것)
- `#265F4D` 메인 초록
- `#14382C` 가장 진한 초록
- `#2E8A64` 라벨 초록
- `#5BBE97` 민트(키 컬러)
- `#E8F5EE` 연한 민트

**정직한 UX**
- 다크패턴 9종을 쓰지 않아요: 숨은 해지, 미리 체크된 동의, 가짜 마감, 죄책감 버튼, 끼워 팔기, 가짜 희소성, 숨은 비용, 몰래 자동 결제, 끝없는 권유.
- 무한 피드를 만들지 않아요. 하루 미션은 끝이 있고, 다 하면 "모두 완료" 화면이 나와요.

**내비게이션**

| 위치 | 규칙 |
|---|---|
| 하단 | 떠 있는 캡슐 탭바 4개(오늘 · 기록 · 두뇌활동 · 내정보). 아이콘 + 라벨, 선택 알약이 미끄러져 이동 |
| 상단 | 앱 바 3종: 탭 첫 화면 = 접히는 큰 제목 / 하위 화면 = 뒤로 가기 / 몰입 플로우 = 닫기(X) 오른쪽 위 |
| 깊은 영역 | 컨텍스트 탭바(떠 있는 뒤로 가기 버튼 + 하위 탭) |
| 안내 | 탭바 말풍선에는 사실만 쓰고, 새 소식은 빨간 점으로 표시 |
| 층 | 시트·다이얼로그는 탭바보다 위 |

**플랫폼 차이**

| 항목 | iOS | 안드로이드 |
|---|---|---|
| 작은 제목 | 가운데 | 왼쪽 |
| 뒤로 가기 | ‹ + 이전 화면 이름 | ← 아이콘 |
| 확인 창 | 알림창 | 다이얼로그 |
| 탭바 | 같은 캡슐 | 같은 캡슐(흐림만 약하게) |

**모션**
- 들어올 때는 감속 곡선 380ms, 나갈 때는 가속 곡선 240ms예요.
- 튕김(오버슈트)은 스위치와 배지에만 써요.
- 움직이는 속성은 `transform`과 `opacity`만 써요.

**말투**
- "~해요"체로 짧게 써요.
- 버튼은 결과를 말하는 동사로 써요. 예: "가입 완료하기"
- 사용자는 "○○님"으로 불러요.
- 이모지 장식과 em 대시는 쓰지 않아요.

**토큰 이름은 유지**
- 코드(웹 CSS, React Native, Flutter, SwiftUI, Compose)와 피그마 변수가 이미 이 이름을 써요.
- 값은 바꿔도 되지만, 이름을 바꾸거나 없애려면 표로 따로 적어 주세요.

## 4. 토큰 이름 목록 (값은 바꿔도 되고 이름은 유지)

| 그룹 | 이름 |
|---|---|
| 색(역할) | `bg` `surface` `surface-sub` `surface-mint` `border` `border-control` `text` `text-2` `text-3` `text-4` `text-accent` `primary` `primary-hover` `primary-pressed` `on-primary` `focus-ring` `error` `error-bg` `warning` `warning-bg` `success` `badge-dot` `disabled-bg` `disabled-text` `scrim` `glass-strong` `toast-bg` `on-toast` |
| 글자(앱) | `display` 32/42 · `title-lg` 24/32 · `title` 20/28 · `headline` 18/26 · `body-lg` 17/26 · `body` 16/24 · `label` 15/22 · `caption` 14/20 · `label-sm` 13/18 · `button` 18/24 |
| 글자(관리자) | `admin-title` 24/32 · `admin-headline` 17/24 · `admin-body` 15/22 · `admin-caption` 13/18 |
| 간격 | `space-hair` 2 · `space-1` 4 · `space-2` 8 · `space-3` 12 · `space-4` 16 · `space-5` 20 · `space-6` 24 · `space-8` 32 · `space-10` 40 |
| 모서리 | `radius-xs` 8 · `radius-sm` 12 · `radius-md` 16 · `radius-lg` 20 · `radius-xl` 24 · `radius-sheet` 28 · `radius-pill` |
| 크기 | `touch-min` 48 · `icon` 24 · `button-height` 56 · `button-height-sm` 48 · `input-height` 56 · `appbar-height` 52 · `tabbar-height` 64 · `admin-sidebar-width` 240 |
| 그림자 | `shadow-card` · `shadow-float` · `shadow-sheet` |
| 모션 | `duration-fast` 150 · `duration-exit` 240 · `duration-enter` 380 · `duration-celebrate` 600 · `ease-enter` · `ease-exit` · `ease-standard` · `ease-spring-soft` |

## 5. 컴포넌트 목록 (지금 22종, 모두 다시 디자인)

| 분류 | 컴포넌트 |
|---|---|
| 액션 | Button(상태 9종: 기본·호버·눌림·포커스·비활성·로딩·성공·오류·선택됨), SocialLoginButton(카카오·네이버·Google·Apple) |
| 입력 | TextField(라벨 고정, 인라인 에러, 비밀번호 강도 표시기), Checkbox(약관 전체·개별 연동), Switch |
| 표시 | Chip, Badge(성취 배지, 새 소식 점), ProgressRing |
| 콘텐츠 | MissionCard(오늘의 훈련), GameCard(게임 썸네일 + 이름) |
| 내비게이션 | AppBar(3종 × iOS·안드로이드), TabBar(캡슐·슬라이딩·말풍선·컨텍스트), StepIndicator |
| 피드백 | BottomSheet, Dialog(iOS 알림창·안드로이드 다이얼로그), Toast·스낵바, EmptyState(다음 행동 하나 필수), Skeleton |
| 브랜드 | Mallangi(맬랑이 포즈 12종), Healthy(헬씨들 117종) |
| 관리자 웹 | AdminShell(사이드바 + 본문), DataTable |

**새로 추가해 주면 좋은 것**
- 아이콘 세트: 선 2px, 24px 격자, 선택 시 채운 아이콘
- 관리자 대시보드 차트 규칙: 그래프 색은 `primary` + `mint-500` 두 색만
- 캐릭터 배치 규칙: 화면 종류별 위치와 크기

## 6. 자료 위치

| 자료 | 위치 |
|---|---|
| 지금 디자인 시스템 (형식 페이지) | https://claude.ai/artifact/89sTp8bxjNk8L2iV23wauy |
| 지금 디자인 시스템 가이드 페이지 | https://claude.ai/artifact/TdYxT47xUQBpoQocGUn46a |
| 토큰·컴포넌트 코드, 에셋 원본 | GitHub `butblank-oss/g-sso` › `design-system/mally/` (tokens.json, tokens.css, components/, assets/) |
| 피그마 변수 | https://www.figma.com/design/PmHLBb5HbHLNoa9nbZYrAr (Color 라이트·다크, Dimension, Typography, Motion) |
| 캐릭터·게임 썸네일 원본 | 피그마 "맬리 그래픽 에셋 모음": 헬씨들 https://www.figma.com/design/gayjnv8NZzyhO9zq7G33nx?node-id=1812-4134 · 게임 썸네일 https://www.figma.com/design/gayjnv8NZzyhO9zq7G33nx?node-id=1804-20475 |
| 브랜드 덱(색·로고·맬랑이 원본) | 맬리 사업소개 덱 https://claude.ai/artifact/NYGVU3CTB91khs1b7LTwnq |
| 좋다고 한 화면 방향 | 4기 개편 프로토타입 https://butblank-oss.github.io/meli.brain/proto-4th/ · 상하단 바 적용판 https://claude.ai/artifact/MNzxjFYk74tqV5Zu7Zi7RU |

## 7. 받고 싶은 결과물

1. 다시 디자인한 디자인 시스템(색·글자·간격·컴포넌트·아이콘·캐릭터 규칙). 라이트·다크 모두 포함해 주세요.
2. 대표 화면 6장으로 시스템이 실제로 어떻게 보이는지 보여주세요. 오늘(홈), 기록(성과), 두뇌활동(게임 목록), 내 정보, 운동 플로우 1장, 관리자 대시보드예요.
3. 바뀐 토큰 값 표와, 이름을 바꾸거나 없앤 것이 있다면 그 표도 주세요. 코드와 피그마 변수에 다시 반영할 거예요.
4. 확인이 필요한 것:
   - 게임 썸네일 "타일뒤집기"와 "기억의 숨바꼭질"이 피그마에서 같은 그림이에요.
   - 탭 이름이 둘로 나뉘어 있어요. 4기 개편안은 "오늘·성과·더 해보기·내 정보", 맬리 프로토타입은 "오늘·기록·두뇌활동·내정보"예요. 하나로 정해 주세요.

## 8. 작업 뒤 반영 경로

Claude Design 결과가 나오면 Claude Code에서 "Claude Design 결과를 맬리 디자인 시스템에 반영해줘"라고 하면 돼요. 다음 순서로 반영해요.
1. `design-system/mally/tokens.json`을 갱신해요.
2. `scripts/build_platforms.py`로 앱 토큰 파일을 다시 만들어요.
3. 피그마 변수를 갱신해요.
4. 가이드 페이지와 지쏘 스킬(claude.ai용 zip 포함)을 갱신해요.
