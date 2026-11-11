// 맬리 디자인 시스템 — tokens.json에서 자동 생성. 직접 고치지 말고 scripts/build_platforms.py를 다시 실행하세요.
import 'package:flutter/material.dart';

class MallyColors extends ThemeExtension<MallyColors> {
  const MallyColors({required this.green950, required this.green900, required this.green700, required this.green600, required this.mint500, required this.mint100, required this.mintOnDark, required this.mintOnDark2, required this.yellowHighlight, required this.bg, required this.surface, required this.surfaceSub, required this.surfaceMint, required this.border, required this.borderControl, required this.text, required this.text2, required this.text3, required this.text4, required this.textAccent, required this.primary, required this.primaryHover, required this.primaryPressed, required this.onPrimary, required this.focusRing, required this.error, required this.errorBg, required this.warning, required this.warningBg, required this.success, required this.badgeDot, required this.disabledBg, required this.disabledText, required this.scrim, required this.glassStrong, required this.toastBg, required this.onToast,});
  final Color green950;
  final Color green900;
  final Color green700;
  final Color green600;
  final Color mint500;
  final Color mint100;
  final Color mintOnDark;
  final Color mintOnDark2;
  final Color yellowHighlight;
  final Color bg;
  final Color surface;
  final Color surfaceSub;
  final Color surfaceMint;
  final Color border;
  final Color borderControl;
  final Color text;
  final Color text2;
  final Color text3;
  final Color text4;
  final Color textAccent;
  final Color primary;
  final Color primaryHover;
  final Color primaryPressed;
  final Color onPrimary;
  final Color focusRing;
  final Color error;
  final Color errorBg;
  final Color warning;
  final Color warningBg;
  final Color success;
  final Color badgeDot;
  final Color disabledBg;
  final Color disabledText;
  final Color scrim;
  final Color glassStrong;
  final Color toastBg;
  final Color onToast;
  static const light = MallyColors(green950: Color(0xFF14382C), green900: Color(0xFF265F4D), green700: Color(0xFF2E8A64), green600: Color(0xFF1FA971), mint500: Color(0xFF5BBE97), mint100: Color(0xFFE8F5EE), mintOnDark: Color(0xFFBFE6D3), mintOnDark2: Color(0xFFE1F2EA), yellowHighlight: Color(0xFFFFE27A), bg: Color(0xFFE7ECE9), surface: Color(0xFFFFFFFF), surfaceSub: Color(0xFFF3F6F4), surfaceMint: Color(0xFFE8F5EE), border: Color(0xFFD5DFDA), borderControl: Color(0xFF788F83), text: Color(0xFF1E2B26), text2: Color(0xFF3E4C46), text3: Color(0xFF55635D), text4: Color(0xFF5E6B65), textAccent: Color(0xFF257552), primary: Color(0xFF265F4D), primaryHover: Color(0xFF2D6B57), primaryPressed: Color(0xFF14382C), onPrimary: Color(0xFFFFFFFF), focusRing: Color(0xFF2E8A64), error: Color(0xFFB8483E), errorBg: Color(0xFFFBEFED), warning: Color(0xFF8A6400), warningBg: Color(0xFFFFF6D9), success: Color(0xFF257552), badgeDot: Color(0xFFE5484D), disabledBg: Color(0xFFE3EAE6), disabledText: Color(0xFF8C978F), scrim: Color(0x52142820), glassStrong: Color(0xF0FFFFFF), toastBg: Color(0xF014382C), onToast: Color(0xFFFFFFFF),);
  static const dark = MallyColors(green950: Color(0xFF14382C), green900: Color(0xFF265F4D), green700: Color(0xFF2E8A64), green600: Color(0xFF1FA971), mint500: Color(0xFF5BBE97), mint100: Color(0xFFE8F5EE), mintOnDark: Color(0xFFBFE6D3), mintOnDark2: Color(0xFFE1F2EA), yellowHighlight: Color(0xFFFFE27A), bg: Color(0xFF0F1714), surface: Color(0xFF17221E), surfaceSub: Color(0xFF1D2A25), surfaceMint: Color(0xFF18342A), border: Color(0xFF2A3A33), borderControl: Color(0xFF5C7268), text: Color(0xFFE8F0EC), text2: Color(0xFFC3D0CA), text3: Color(0xFFA3B2AB), text4: Color(0xFF8FA099), textAccent: Color(0xFF7FD0AE), primary: Color(0xFF5BBE97), primaryHover: Color(0xFF6CC7A3), primaryPressed: Color(0xFF7FD0AE), onPrimary: Color(0xFF0F2A20), focusRing: Color(0xFF7FD0AE), error: Color(0xFFF08A80), errorBg: Color(0xFF3A1F1C), warning: Color(0xFFE8C15A), warningBg: Color(0xFF362C10), success: Color(0xFF7FD0AE), badgeDot: Color(0xFFFF6B6E), disabledBg: Color(0xFF26332E), disabledText: Color(0xFF66756E), scrim: Color(0x8F000000), glassStrong: Color(0xF01D2A25), toastBg: Color(0xF5E8F0EC), onToast: Color(0xFF14382C),);
  @override MallyColors copyWith() => this;
  @override MallyColors lerp(ThemeExtension<MallyColors>? other, double t) => t < .5 ? this : (other as MallyColors? ?? this);
}

class MallySpacing {static const double shair = 2; static const double s1 = 4; static const double s2 = 8; static const double s3 = 12; static const double s4 = 16; static const double s5 = 20; static const double s6 = 24; static const double s8 = 32; static const double s10 = 40;}
class MallyRadius {static const double xs = 8; static const double sm = 12; static const double md = 16; static const double lg = 20; static const double xl = 24; static const double sheet = 28; static const double pill = 999;}
class MallySize {static const double touchMin = 48; static const double icon = 24; static const double buttonHeight = 56; static const double buttonHeightSm = 48; static const double inputHeight = 56; static const double appbarHeight = 52; static const double tabbarHeight = 64; static const double adminSidebarWidth = 240;}
class MallyMotion {static const fast = Duration(milliseconds: 150); static const exit = Duration(milliseconds: 240); static const enter = Duration(milliseconds: 380); static const celebrate = Duration(milliseconds: 600); static const enter = Cubic(0.32, 0.72, 0, 1); static const exit = Cubic(0.4, 0, 1, 1); static const standard = Cubic(0.22, 1, 0.36, 1); static const springSoft = Cubic(0.34, 1.2, 0.64, 1);}

class MallyText {
  static const _f = 'Pretendard';
  static const display = TextStyle(fontFamily: _f, fontSize: 32, height: 1.3125, fontWeight: FontWeight.w800, letterSpacing: -0.64);
  static const titleLg = TextStyle(fontFamily: _f, fontSize: 24, height: 1.3333, fontWeight: FontWeight.w800, letterSpacing: -0.48);
  static const title = TextStyle(fontFamily: _f, fontSize: 20, height: 1.4000, fontWeight: FontWeight.w700, letterSpacing: -0.4);
  static const headline = TextStyle(fontFamily: _f, fontSize: 18, height: 1.4444, fontWeight: FontWeight.w700, letterSpacing: 0);
  static const bodyLg = TextStyle(fontFamily: _f, fontSize: 17, height: 1.5294, fontWeight: FontWeight.w400, letterSpacing: 0);
  static const body = TextStyle(fontFamily: _f, fontSize: 16, height: 1.5000, fontWeight: FontWeight.w400, letterSpacing: 0);
  static const label = TextStyle(fontFamily: _f, fontSize: 15, height: 1.4667, fontWeight: FontWeight.w600, letterSpacing: 0);
  static const caption = TextStyle(fontFamily: _f, fontSize: 14, height: 1.4286, fontWeight: FontWeight.w500, letterSpacing: 0);
  static const labelSm = TextStyle(fontFamily: _f, fontSize: 13, height: 1.3846, fontWeight: FontWeight.w700, letterSpacing: 0);
  static const button = TextStyle(fontFamily: _f, fontSize: 18, height: 1.3333, fontWeight: FontWeight.w700, letterSpacing: 0);
  static const adminTitle = TextStyle(fontFamily: _f, fontSize: 24, height: 1.3333, fontWeight: FontWeight.w700, letterSpacing: 0);
  static const adminHeadline = TextStyle(fontFamily: _f, fontSize: 17, height: 1.4118, fontWeight: FontWeight.w700, letterSpacing: 0);
  static const adminBody = TextStyle(fontFamily: _f, fontSize: 15, height: 1.4667, fontWeight: FontWeight.w400, letterSpacing: 0);
  static const adminCaption = TextStyle(fontFamily: _f, fontSize: 13, height: 1.3846, fontWeight: FontWeight.w500, letterSpacing: 0);
}

ThemeData mallyTheme(Brightness b) {
  final c = b == Brightness.dark ? MallyColors.dark : MallyColors.light;
  return ThemeData(
    brightness: b,
    fontFamily: 'Pretendard',
    scaffoldBackgroundColor: c.bg,
    colorScheme: ColorScheme.fromSeed(seedColor: c.primary, brightness: b).copyWith(primary: c.primary, onPrimary: c.onPrimary, surface: c.surface, error: c.error),
    extensions: [c],
  );
}
