# 피그마 변수

파일: [맬리 디자인 시스템 · 토큰](https://www.figma.com/design/PmHLBb5HbHLNoa9nbZYrAr) (Onemedics 팀)

| 컬렉션 | 모드 | 수 | 내용 |
|---|---|---|---|
| Primitives | Value | 9 | 브랜드 원색 `brand/green-900` 등 |
| Color | Light · Dark | 28 | 역할 색. 원색은 별칭(alias)으로 연결 |
| Dimension | Value | 24 | `space/*` (GAP) · `radius/*` (CORNER_RADIUS) · `size/*` (WIDTH_HEIGHT) |
| Typography | Value | 26 | `font/family`, `font-size/*`, `line-height/*`, `font-weight/*` |
| Motion | Value | 8 | `duration/*` (TIMING) · `easing/*` (EASING) |

- 모든 변수에 쓰는 곳(scope), 설명, 코드 이름(WEB `var(--…)`, iOS `MallyColor.…`, ANDROID `colors.…`)을 넣었어요.
- 그림자 스타일 6개: `Shadow/shadow-card|float|sheet/Light|Dark`.
- **글자 스타일은 아직 없어요.** 피그마 계정에서 Pretendard를 쓸 수 없어서예요. 팀 공유 폰트로 Pretendard를 올리거나 피그마 데스크톱 앱이 설치된 컴퓨터에 Pretendard를 설치한 뒤, Claude에게 "피그마 글자 스타일 만들어줘"라고 하면 `create-variables.js`의 글자 스타일 부분을 다시 실행해요.
- `create-variables.js`는 tokens.json에서 만든 스크립트예요. 실행하면 기존 변수·스타일을 지우고 다시 만들어요.
