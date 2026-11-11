# 앱 프레임워크용 토큰

`tokens.json`에서 자동 생성한 파일이에요. 값을 바꿀 때는 `tokens.json`만 고치고 `python3 design-system/mally/scripts/build_platforms.py`를 실행하세요.

| 플랫폼 | 파일 | 쓰는 법 |
|---|---|---|
| 웹 · 웹뷰 · 관리자 웹 | `../tokens.css`, `../components/bundle.css` | CSS에 그대로 넣고 `var(--primary)`, `.m-btn` |
| React Native | `react-native/theme.ts` | `useColorScheme()`로 `lightColors`/`darkColors` 고르고 `typography.bodyLg` 등을 스타일에 펼쳐 쓰기. 이징은 Reanimated `Easing.bezier(...easing.enter)` |
| Flutter | `flutter/mally_theme.dart` | `MaterialApp(theme: mallyTheme(Brightness.light), darkTheme: mallyTheme(Brightness.dark))`, 색은 `Theme.of(context).extension<MallyColors>()!` |
| iOS (SwiftUI) | `ios/MallyTheme.swift` | `MallyColor.primary`(다크 자동), 글자는 `.mallyText(MallyText.bodyLg)` (Dynamic Type 연동) |
| 안드로이드 (Compose) | `android/MallyTheme.kt` | `CompositionLocal`로 `MallyLightColors`/`MallyDarkColors` 제공, `MallyText.bodyLg`, `MallySpacing.s4` |

공통 주의
- 폰트 Pretendard(가변)를 각 앱에 포함하세요: `../fonts/PretendardVariable.woff2`는 웹용이라 앱에는 Pretendard 배포본의 ttf/otf를 쓰세요.
- 단위: 웹 px = RN dp = iOS pt = 안드로이드 dp/sp. 같은 숫자를 그대로 씁니다.
- 글자 크기는 시스템 글자 크기 설정을 따라 커지게 두세요(안드로이드 sp, iOS Dynamic Type).
