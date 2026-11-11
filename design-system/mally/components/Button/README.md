주요 행동을 실행하는 버튼으로, 한 화면에 주요(primary) 버튼은 하나만 둔다.

- 종류: `m-btn--primary`(주요), `m-btn--secondary`(보조, 민트 면), `m-btn--ghost`(텍스트 버튼). 크기: 기본 58px, `m-btn--sm` 50px.
- 상태 9종을 모두 만든다: 기본, 호버, 눌림(`is-pressed`), 포커스(`is-focus`), 비활성(`disabled`), 로딩(`is-loading` + `m-spin`, 문구는 "~하는 중"), 성공(`is-success`), 오류(`is-error`, 짧게 흔들림), 선택됨(`is-selected`).
- 화면 아래 고정 버튼은 `m-btn--block`. 좌우 여백 `space-screen`.
- 문구는 결과를 말하는 동사: "가입 완료하기", "오늘의 훈련 시작하기". "확인"만 쓰지 않는다.
- 하지 말 것: 주요 버튼 두 개 나란히, 비활성 이유를 숨기기(입력 칸 아래 인라인 에러로 이유를 보여준다).
