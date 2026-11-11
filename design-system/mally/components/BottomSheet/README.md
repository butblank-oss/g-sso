아래에서 올라오는 선택·상세 창(미션 상세, 약관 보기, 순위). 꼭 멈춰야 하는 결정은 Dialog.

- 위 모서리 `radius-sheet`, 손잡이 40×5, `shadow-sheet`, 뒤 딤 `scrim`. 안쪽 `space-5`.
- 층: 딤 50·시트 51로 **탭바보다 위**.
- 모션: 열림 `duration-enter`+`ease-enter`, 닫힘 `duration-exit`+`ease-exit`. 오버슈트 금지.
- 포커스: 다 올라온 뒤 `focus({preventScroll:true})`. 닫힌 동안 `visibility:hidden`, 닫으면 연 버튼으로 포커스 복귀.
