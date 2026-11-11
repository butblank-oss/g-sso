---
name: mally-design-system
description: 맬리(어르신 두뇌 건강 앱·치매안심센터 관리자 웹) 디자인 시스템. 맬리 화면·프로토타입·슬라이드·문서·이미지·코드를 만들거나 고칠 때 반드시 사용. 색·글자(Pretendard)·간격·모서리·모션 토큰, 시니어 접근성 규칙, 컴포넌트 22종 규칙과 CSS, 앱(React Native·Flutter·SwiftUI·Compose) 테마 파일, 로고·맬랑이·헬씨들·게임 썸네일 목록을 담고 있다.
---

# 맬리 디자인 시스템

맬리와 관련된 무엇이든 만들 때 이 규칙과 값을 그대로 쓴다. 값을 새로 만들지 않는다.

## 읽는 순서
1. `references/brand-book.md`: 원칙, 말투, 색, 글자, 간격, 모션, 내비게이션, 플랫폼, 접근성 규칙
2. `references/tokens.css` (또는 `tokens.json`): 실제 값. 라이트·다크 두 테마
3. `references/components.md`: 컴포넌트 22종 규칙. 클래스는 `references/components.css`
4. `references/assets.md`: 로고·맬랑이·헬씨들·게임 썸네일과 폰트
5. 앱 코드: `references/platforms/`의 React Native·Flutter·SwiftUI·Compose 테마 파일

## 꼭 지킬 것
- 글꼴은 Pretendard 하나. 앱 본문 17px, 최소 14px(관리자 웹 13px). 누르는 곳 48px 이상. 글자 대비 4.5:1 이상.
- 한 화면 색: 무채색 + 브랜드 초록 1개(+ 꼭 필요할 때 경고색 1개). 초록 역할은 `primary`(버튼)·`text-accent`(초록 글자)·`surface-mint`(선택 표시) 셋뿐. 성공은 체크 아이콘 + "완료" 글자.
- 면: 회색 바탕 `bg` + 흰 카드 `surface`. 반투명 유리는 탭바에만.
- 캐릭터 색(노랑·파랑·분홍 등)은 그림 안에서만. 맬랑이·헬씨는 한 화면에 하나.
- 다크패턴 금지, 무한 피드 금지(하루 미션은 끝이 있고 "모두 완료"로 멈춤).
- 말투: "~해요"체, 버튼은 결과를 말하는 동사("가입 완료하기"), 사용자는 "○○님", 이모지 장식·em 대시 금지.
- 내비게이션: 하단 떠 있는 캡슐 탭바(아이콘 + 라벨), 상단 앱 바 3종(접히는 큰 제목 / 뒤로 가기 / 닫기 X 오른쪽). iOS·안드로이드 차이는 brand-book의 플랫폼 표.

## 만드는 법
- HTML·아티팩트: `tokens.css`와 `components.css`를 `<style>`에 넣고 `var(--primary)`, `.m-btn` 같은 클래스로 만든다. 루트에 `class="m-root"`, 다크는 `data-theme="dark"`.
- 앱 코드: 플랫폼 테마 파일의 이름(`lightColors.primary`, `MallyText.bodyLg` 등)을 쓴다.
- 슬라이드·문서·이미지: brand-book의 색·글자 규칙을 따른다(배경 bg/surface, 강조 primary, 글자 Pretendard).
- 결과를 보여줄 때 어떤 토큰·컴포넌트를 썼는지 짧게 적는다.
