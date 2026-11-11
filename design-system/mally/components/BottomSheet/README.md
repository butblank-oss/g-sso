아래에서 올라오는 선택·상세 창으로, 미션 상세, 약관 보기, 선택지 고르기에 쓴다. 꼭 멈춰야 하는 결정은 Dialog.

- 위 모서리 `radius-sheet`, 손잡이(42×5px), 그림자 `shadow-sheet`, 뒤 딤 `scrim`.
- **모션**: 열림 `duration-enter` + `ease-enter`, 닫힘 `duration-exit` + `ease-exit`. 오버슈트 금지. `transform`만 움직인다.
- **포커스**: 시트가 다 올라온 뒤 `focus({preventScroll:true})`. 화면 밖 요소에 포커스를 주면 뒤 화면이 끌려 올라가 출렁인다. 닫힌 동안 `visibility:hidden`, 닫으면 연 버튼으로 포커스 복귀.
- 닫기: 딤 누르기, 아래로 끌기, ESC, 안드로이드 뒤로 가기.
- 플랫폼: iOS에서 선택지만 나열할 때는 액션 시트 모양(취소 따로)도 허용.
- 층: 딤과 시트는 하단 탭바보다 위(z-index 50·51). 탭바가 시트를 가리면 안 된다.
