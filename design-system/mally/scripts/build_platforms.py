"""tokens.json → 앱 프레임워크별 테마 파일 생성.

실행: python3 design-system/mally/scripts/build_platforms.py
결과: design-system/mally/platforms/{react-native,flutter,ios,android}/
tokens.json을 고친 뒤 다시 실행하면 네 파일이 같이 바뀐다. 직접 고치지 말 것.
"""
import json, os, re

HERE = os.path.dirname(os.path.abspath(__file__))
BASE = os.path.dirname(HERE)
T = json.load(open(os.path.join(BASE, "tokens.json")))
OUT = os.path.join(BASE, "platforms")

# ---------- 값 정리 ----------
colors = {c["name"]: c["value"] for c in T["color"]["tokens"]}
def resolve(name, theme, depth=0):
    v = colors[name]
    if isinstance(v, dict): v = v.get(theme, v["light"])
    if v.startswith("{"): return resolve(v[1:-1], theme, depth + 1)
    return v
def rgba(v):
    v = v.strip()
    if v.startswith("#"):
        h = v[1:]
        if len(h) == 3: h = "".join(c * 2 for c in h)
        r, g, b = int(h[0:2], 16), int(h[2:4], 16), int(h[4:6], 16)
        a = int(h[6:8], 16) / 255 if len(h) == 8 else 1.0
        return r, g, b, a
    m = re.match(r"rgba?\(([^)]+)\)", v)
    p = [x.strip() for x in m.group(1).split(",")]
    return int(p[0]), int(p[1]), int(p[2]), float(p[3]) if len(p) > 3 else 1.0
def hexa(r, g, b, a):  # #AARRGGBB
    return f"{round(a*255):02X}{r:02X}{g:02X}{b:02X}"
def camel(n):
    parts = re.split(r"[-.]", n)
    return parts[0] + "".join(x[:1].upper() + x[1:] for x in parts[1:])
def num(v): return float(re.sub(r"[a-z%]+$", "", str(v)))

C = {n: {t: rgba(resolve(n, t)) for t in ("light", "dark")} for n in colors}
spacing = {t["name"]: num(t["value"]) for t in T["spacing"]["tokens"]}
radius = {t["name"]: num(t["value"]) for t in T["radius"]["tokens"]}
size = {t["name"]: num(t["value"]) for t in T["size"]["tokens"]}
dur = {t["name"]: num(t["value"]) for t in T["duration"]["tokens"]}
easing = {t["name"]: [float(x) for x in re.findall(r"-?\d+(?:\.\d+)?", t["value"].split("(",1)[1])] for t in T["easing"]["tokens"]}
styles = [s for g in T["type"]["groups"] for s in g["styles"]]
TYPE = [(s["name"], num(s["fontSize"]), num(s["lineHeight"]), int(s["fontWeight"]), num(s.get("letterSpacing", "0").replace("em", "")) if "em" in str(s.get("letterSpacing", "")) else 0.0) for s in styles]

HEADER = "맬리 디자인 시스템 — tokens.json에서 자동 생성. 직접 고치지 말고 scripts/build_platforms.py를 다시 실행하세요."

def w(rel, text):
    p = os.path.join(OUT, rel); os.makedirs(os.path.dirname(p), exist_ok=True); open(p, "w").write(text)

# ---------- React Native (TypeScript) ----------
def rn_color(t): r, g, b, a = t; return f"'rgba({r},{g},{b},{a:g})'" if a < 1 else f"'#{r:02X}{g:02X}{b:02X}'"
rn = [f"// {HEADER}", "import { Platform } from 'react-native';", ""]
for theme in ("light", "dark"):
    rn.append(f"export const {theme}Colors = {{")
    rn += [f"  {camel(n)}: {rn_color(C[n][theme])}," for n in colors]
    rn.append("} as const;\n")
rn.append("export type MallyColors = typeof lightColors;\n")
rn.append("export const spacing = {" + ", ".join(f"{camel(k.replace('space-', 's'))}: {v:g}" for k, v in spacing.items()) + "} as const;")
rn.append("export const radius = {" + ", ".join(f"{camel(k.replace('radius-', ''))}: {v:g}" for k, v in radius.items()) + "} as const;")
rn.append("export const size = {" + ", ".join(f"{camel(k)}: {v:g}" for k, v in size.items()) + "} as const;")
rn.append("export const duration = {" + ", ".join(f"{camel(k.replace('duration-', ''))}: {v:g}" for k, v in dur.items()) + "} as const;")
rn.append("/** Reanimated Easing.bezier(...)에 그대로 넣는다 */")
rn.append("export const easing = {" + ", ".join(f"{camel(k.replace('ease-', ''))}: [{', '.join(f'{x:g}' for x in v)}] as const" for k, v in easing.items()) + "};")
rn.append("\n/** Pretendard를 앱에 포함하고 fontFamily 이름을 맞춘다. 굵기별 파일을 쓰면 fontFamily를 굵기마다 바꾼다 */")
rn.append("export const fontFamily = Platform.select({ ios: 'Pretendard', android: 'Pretendard', default: 'Pretendard' });")
rn.append("export const typography = {")
for n, fs, lh, fw, ls in TYPE:
    rn.append(f"  {camel(n)}: {{ fontFamily, fontSize: {fs:g}, lineHeight: {lh:g}, fontWeight: '{fw}' as const, letterSpacing: {fs*ls:g} }},")
rn.append("} as const;\n")
rn.append("export const theme = { light: { colors: lightColors }, dark: { colors: darkColors }, spacing, radius, size, duration, easing, typography };")
rn.append("export default theme;\n")
w("react-native/theme.ts", "\n".join(rn))

# ---------- Flutter (Dart) ----------
dt = [f"// {HEADER}", "import 'package:flutter/material.dart';", "", "class MallyColors extends ThemeExtension<MallyColors> {",
      "  const MallyColors({" + " ".join(f"required this.{camel(n)}," for n in colors) + "});"]
dt += [f"  final Color {camel(n)};" for n in colors]
for theme in ("light", "dark"):
    dt.append(f"  static const {theme} = MallyColors(" + " ".join(f"{camel(n)}: Color(0x{hexa(*C[n][theme])})," for n in colors) + ");")
dt.append("  @override MallyColors copyWith() => this;")
dt.append("  @override MallyColors lerp(ThemeExtension<MallyColors>? other, double t) => t < .5 ? this : (other as MallyColors? ?? this);")
dt.append("}\n")
dt.append("class MallySpacing {" + " ".join(f"static const double {camel(k.replace('space-', 's'))} = {v:g};" for k, v in spacing.items()) + "}")
dt.append("class MallyRadius {" + " ".join(f"static const double {camel(k.replace('radius-', ''))} = {v:g};" for k, v in radius.items()) + "}")
dt.append("class MallySize {" + " ".join(f"static const double {camel(k)} = {v:g};" for k, v in size.items()) + "}")
dt.append("class MallyMotion {" + " ".join(f"static const {camel(k.replace('duration-', ''))} = Duration(milliseconds: {int(v)});" for k, v in dur.items()) + " " + " ".join(f"static const {camel(k.replace('ease-', ''))} = Cubic({', '.join(f'{x:g}' for x in v)});" for k, v in easing.items()) + "}\n")
dt.append("class MallyText {\n  static const _f = 'Pretendard';")
for n, fs, lh, fw, ls in TYPE:
    dt.append(f"  static const {camel(n)} = TextStyle(fontFamily: _f, fontSize: {fs:g}, height: {lh/fs:.4f}, fontWeight: FontWeight.w{fw}, letterSpacing: {fs*ls:g});")
dt.append("}\n")
dt.append("""ThemeData mallyTheme(Brightness b) {
  final c = b == Brightness.dark ? MallyColors.dark : MallyColors.light;
  return ThemeData(
    brightness: b,
    fontFamily: 'Pretendard',
    scaffoldBackgroundColor: c.bg,
    colorScheme: ColorScheme.fromSeed(seedColor: c.primary, brightness: b).copyWith(primary: c.primary, onPrimary: c.onPrimary, surface: c.surface, error: c.error),
    extensions: [c],
  );
}
""")
w("flutter/mally_theme.dart", "\n".join(dt))

# ---------- iOS (SwiftUI) ----------
def sw(t): r, g, b, a = t; return f"UIColor(red: {r/255:.4f}, green: {g/255:.4f}, blue: {b/255:.4f}, alpha: {a:g})"
sv = [f"// {HEADER}", "import SwiftUI", "import UIKit", "",
      "private func dynamic(_ light: UIColor, _ dark: UIColor) -> Color {",
      "    Color(UIColor { $0.userInterfaceStyle == .dark ? dark : light })", "}", "",
      "public enum MallyColor {"]
sv += [f"    public static let {camel(n)} = dynamic({sw(C[n]['light'])}, {sw(C[n]['dark'])})" for n in colors]
sv.append("}\n")
sv.append("public enum MallySpacing {" + " ".join(f"public static let {camel(k.replace('space-', 's'))}: CGFloat = {v:g};" for k, v in spacing.items()) + "}")
sv.append("public enum MallyRadius {" + " ".join(f"public static let {camel(k.replace('radius-', ''))}: CGFloat = {v:g};" for k, v in radius.items()) + "}")
sv.append("public enum MallySize {" + " ".join(f"public static let {camel(k)}: CGFloat = {v:g};" for k, v in size.items()) + "}")
sv.append("public enum MallyMotion {" + " ".join(f"public static let {camel(k.replace('duration-', ''))}: Double = {v/1000:g};" for k, v in dur.items()) + " " + " ".join(f"public static let {camel(k.replace('ease-', ''))} = Animation.timingCurve({', '.join(f'{x:g}' for x in v)}, duration: 0.38);" for k, v in easing.items()) + "}\n")
sv.append("public struct MallyTextStyle { public let size: CGFloat; public let lineHeight: CGFloat; public let weight: Font.Weight; public let tracking: CGFloat }")
wmap = {400: ".regular", 500: ".medium", 600: ".semibold", 700: ".bold", 800: ".heavy"}
sv.append("public enum MallyText {")
for n, fs, lh, fw, ls in TYPE:
    sv.append(f"    public static let {camel(n)} = MallyTextStyle(size: {fs:g}, lineHeight: {lh:g}, weight: {wmap[fw]}, tracking: {fs*ls:g})")
sv.append("}\n")
sv.append("""public extension View {
    /// Pretendard + 줄간격 적용. 시스템 글자 크기(Dynamic Type)를 따라 커지도록 relativeTo를 지정한다.
    func mallyText(_ s: MallyTextStyle, relativeTo: Font.TextStyle = .body) -> some View {
        self.font(.custom("Pretendard", size: s.size, relativeTo: relativeTo).weight(s.weight))
            .tracking(s.tracking)
            .lineSpacing(s.lineHeight - s.size)
    }
}
""")
w("ios/MallyTheme.swift", "\n".join(sv))

# ---------- Android (Jetpack Compose, Kotlin) ----------
kt = [f"// {HEADER}", "package com.mally.design", "",
      "import androidx.compose.animation.core.CubicBezierEasing", "import androidx.compose.runtime.Immutable",
      "import androidx.compose.ui.graphics.Color", "import androidx.compose.ui.text.TextStyle", "import androidx.compose.ui.text.font.FontWeight",
      "import androidx.compose.ui.unit.dp", "import androidx.compose.ui.unit.sp", "",
      "@Immutable", "data class MallyColors("]
kt += [f"    val {camel(n)}: Color," for n in colors]
kt.append(")\n")
for theme in ("light", "dark"):
    kt.append(f"val Mally{theme.title()}Colors = MallyColors(")
    kt += [f"    {camel(n)} = Color(0x{hexa(*C[n][theme])})," for n in colors]
    kt.append(")\n")
kt.append("object MallySpacing {" + " ".join(f"val {camel(k.replace('space-', 's'))} = {v:g}.dp;" for k, v in spacing.items()) + "}")
kt.append("object MallyRadius {" + " ".join(f"val {camel(k.replace('radius-', ''))} = {v:g}.dp;" for k, v in radius.items()) + "}")
kt.append("object MallySize {" + " ".join(f"val {camel(k)} = {v:g}.dp;" for k, v in size.items()) + "}")
kt.append("object MallyMotion {" + " ".join(f"const val {camel(k.replace('duration-', ''))} = {int(v)};" for k, v in dur.items()) + " " + " ".join(f"val {camel(k.replace('ease-', ''))} = CubicBezierEasing({', '.join(f'{x:g}f' for x in v)});" for k, v in easing.items()) + "}\n")
kt.append("/** res/font/pretendard.ttf(가변)를 넣고 FontFamily(Font(R.font.pretendard))로 fontFamily를 지정한다 */")
kt.append("object MallyText {")
for n, fs, lh, fw, ls in TYPE:
    kt.append(f"    val {camel(n)} = TextStyle(fontSize = {fs:g}.sp, lineHeight = {lh:g}.sp, fontWeight = FontWeight({fw}), letterSpacing = {fs*ls:g}.sp)")
kt.append("}\n")
w("android/MallyTheme.kt", "\n".join(kt))

w("README.md", """# 앱 프레임워크용 토큰

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
""")
print("ok", sorted(os.listdir(OUT)))
