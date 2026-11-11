// 맬리 디자인 시스템 — tokens.json에서 자동 생성. 직접 고치지 말고 scripts/build_platforms.py를 다시 실행하세요.
package com.mally.design

import androidx.compose.animation.core.CubicBezierEasing
import androidx.compose.runtime.Immutable
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp

@Immutable
data class MallyColors(
    val green950: Color,
    val green900: Color,
    val green700: Color,
    val green600: Color,
    val mint500: Color,
    val mint100: Color,
    val mintOnDark: Color,
    val mintOnDark2: Color,
    val yellowHighlight: Color,
    val bg: Color,
    val surface: Color,
    val surfaceSub: Color,
    val surfaceMint: Color,
    val border: Color,
    val borderControl: Color,
    val text: Color,
    val text2: Color,
    val text3: Color,
    val text4: Color,
    val textAccent: Color,
    val primary: Color,
    val primaryHover: Color,
    val primaryPressed: Color,
    val onPrimary: Color,
    val focusRing: Color,
    val error: Color,
    val errorBg: Color,
    val warning: Color,
    val warningBg: Color,
    val success: Color,
    val badgeDot: Color,
    val disabledBg: Color,
    val disabledText: Color,
    val scrim: Color,
    val glassStrong: Color,
    val toastBg: Color,
    val onToast: Color,
)

val MallyLightColors = MallyColors(
    green950 = Color(0xFF14382C),
    green900 = Color(0xFF265F4D),
    green700 = Color(0xFF2E8A64),
    green600 = Color(0xFF1FA971),
    mint500 = Color(0xFF5BBE97),
    mint100 = Color(0xFFE8F5EE),
    mintOnDark = Color(0xFFBFE6D3),
    mintOnDark2 = Color(0xFFE1F2EA),
    yellowHighlight = Color(0xFFFFE27A),
    bg = Color(0xFFE7ECE9),
    surface = Color(0xFFFFFFFF),
    surfaceSub = Color(0xFFF3F6F4),
    surfaceMint = Color(0xFFE8F5EE),
    border = Color(0xFFD5DFDA),
    borderControl = Color(0xFF788F83),
    text = Color(0xFF1E2B26),
    text2 = Color(0xFF3E4C46),
    text3 = Color(0xFF55635D),
    text4 = Color(0xFF5E6B65),
    textAccent = Color(0xFF257552),
    primary = Color(0xFF265F4D),
    primaryHover = Color(0xFF2D6B57),
    primaryPressed = Color(0xFF14382C),
    onPrimary = Color(0xFFFFFFFF),
    focusRing = Color(0xFF2E8A64),
    error = Color(0xFFB8483E),
    errorBg = Color(0xFFFBEFED),
    warning = Color(0xFF8A6400),
    warningBg = Color(0xFFFFF6D9),
    success = Color(0xFF257552),
    badgeDot = Color(0xFFE5484D),
    disabledBg = Color(0xFFE3EAE6),
    disabledText = Color(0xFF8C978F),
    scrim = Color(0x52142820),
    glassStrong = Color(0xF0FFFFFF),
    toastBg = Color(0xF014382C),
    onToast = Color(0xFFFFFFFF),
)

val MallyDarkColors = MallyColors(
    green950 = Color(0xFF14382C),
    green900 = Color(0xFF265F4D),
    green700 = Color(0xFF2E8A64),
    green600 = Color(0xFF1FA971),
    mint500 = Color(0xFF5BBE97),
    mint100 = Color(0xFFE8F5EE),
    mintOnDark = Color(0xFFBFE6D3),
    mintOnDark2 = Color(0xFFE1F2EA),
    yellowHighlight = Color(0xFFFFE27A),
    bg = Color(0xFF0F1714),
    surface = Color(0xFF17221E),
    surfaceSub = Color(0xFF1D2A25),
    surfaceMint = Color(0xFF18342A),
    border = Color(0xFF2A3A33),
    borderControl = Color(0xFF5C7268),
    text = Color(0xFFE8F0EC),
    text2 = Color(0xFFC3D0CA),
    text3 = Color(0xFFA3B2AB),
    text4 = Color(0xFF8FA099),
    textAccent = Color(0xFF7FD0AE),
    primary = Color(0xFF5BBE97),
    primaryHover = Color(0xFF6CC7A3),
    primaryPressed = Color(0xFF7FD0AE),
    onPrimary = Color(0xFF0F2A20),
    focusRing = Color(0xFF7FD0AE),
    error = Color(0xFFF08A80),
    errorBg = Color(0xFF3A1F1C),
    warning = Color(0xFFE8C15A),
    warningBg = Color(0xFF362C10),
    success = Color(0xFF7FD0AE),
    badgeDot = Color(0xFFFF6B6E),
    disabledBg = Color(0xFF26332E),
    disabledText = Color(0xFF66756E),
    scrim = Color(0x8F000000),
    glassStrong = Color(0xF01D2A25),
    toastBg = Color(0xF5E8F0EC),
    onToast = Color(0xFF14382C),
)

object MallySpacing {val shair = 2.dp; val s1 = 4.dp; val s2 = 8.dp; val s3 = 12.dp; val s4 = 16.dp; val s5 = 20.dp; val s6 = 24.dp; val s8 = 32.dp; val s10 = 40.dp;}
object MallyRadius {val xs = 8.dp; val sm = 12.dp; val md = 16.dp; val lg = 20.dp; val xl = 24.dp; val sheet = 28.dp; val pill = 999.dp;}
object MallySize {val touchMin = 48.dp; val icon = 24.dp; val buttonHeight = 56.dp; val buttonHeightSm = 48.dp; val inputHeight = 56.dp; val appbarHeight = 52.dp; val tabbarHeight = 64.dp; val adminSidebarWidth = 240.dp;}
object MallyMotion {const val fast = 150; const val exit = 240; const val enter = 380; const val celebrate = 600; val enter = CubicBezierEasing(0.32f, 0.72f, 0f, 1f); val exit = CubicBezierEasing(0.4f, 0f, 1f, 1f); val standard = CubicBezierEasing(0.22f, 1f, 0.36f, 1f); val springSoft = CubicBezierEasing(0.34f, 1.2f, 0.64f, 1f);}

/** res/font/pretendard.ttf(가변)를 넣고 FontFamily(Font(R.font.pretendard))로 fontFamily를 지정한다 */
object MallyText {
    val display = TextStyle(fontSize = 32.sp, lineHeight = 42.sp, fontWeight = FontWeight(800), letterSpacing = -0.64.sp)
    val titleLg = TextStyle(fontSize = 24.sp, lineHeight = 32.sp, fontWeight = FontWeight(800), letterSpacing = -0.48.sp)
    val title = TextStyle(fontSize = 20.sp, lineHeight = 28.sp, fontWeight = FontWeight(700), letterSpacing = -0.4.sp)
    val headline = TextStyle(fontSize = 18.sp, lineHeight = 26.sp, fontWeight = FontWeight(700), letterSpacing = 0.sp)
    val bodyLg = TextStyle(fontSize = 17.sp, lineHeight = 26.sp, fontWeight = FontWeight(400), letterSpacing = 0.sp)
    val body = TextStyle(fontSize = 16.sp, lineHeight = 24.sp, fontWeight = FontWeight(400), letterSpacing = 0.sp)
    val label = TextStyle(fontSize = 15.sp, lineHeight = 22.sp, fontWeight = FontWeight(600), letterSpacing = 0.sp)
    val caption = TextStyle(fontSize = 14.sp, lineHeight = 20.sp, fontWeight = FontWeight(500), letterSpacing = 0.sp)
    val labelSm = TextStyle(fontSize = 13.sp, lineHeight = 18.sp, fontWeight = FontWeight(700), letterSpacing = 0.sp)
    val button = TextStyle(fontSize = 18.sp, lineHeight = 24.sp, fontWeight = FontWeight(700), letterSpacing = 0.sp)
    val adminTitle = TextStyle(fontSize = 24.sp, lineHeight = 32.sp, fontWeight = FontWeight(700), letterSpacing = 0.sp)
    val adminHeadline = TextStyle(fontSize = 17.sp, lineHeight = 24.sp, fontWeight = FontWeight(700), letterSpacing = 0.sp)
    val adminBody = TextStyle(fontSize = 15.sp, lineHeight = 22.sp, fontWeight = FontWeight(400), letterSpacing = 0.sp)
    val adminCaption = TextStyle(fontSize = 13.sp, lineHeight = 18.sp, fontWeight = FontWeight(500), letterSpacing = 0.sp)
}
