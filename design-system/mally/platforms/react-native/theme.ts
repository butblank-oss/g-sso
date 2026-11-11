// 맬리 디자인 시스템 — tokens.json에서 자동 생성. 직접 고치지 말고 scripts/build_platforms.py를 다시 실행하세요.
import { Platform } from 'react-native';

export const lightColors = {
  green950: '#14382C',
  green900: '#265F4D',
  green700: '#2E8A64',
  green600: '#1FA971',
  mint500: '#5BBE97',
  mint100: '#E8F5EE',
  mintOnDark: '#BFE6D3',
  mintOnDark2: '#E1F2EA',
  yellowHighlight: '#FFE27A',
  bg: '#E7ECE9',
  surface: '#FFFFFF',
  surfaceSub: '#F3F6F4',
  surfaceMint: '#E8F5EE',
  border: '#D5DFDA',
  borderControl: '#788F83',
  text: '#1E2B26',
  text2: '#3E4C46',
  text3: '#55635D',
  text4: '#5E6B65',
  textAccent: '#257552',
  primary: '#265F4D',
  primaryHover: '#2D6B57',
  primaryPressed: '#14382C',
  onPrimary: '#FFFFFF',
  focusRing: '#2E8A64',
  error: '#B8483E',
  errorBg: '#FBEFED',
  warning: '#8A6400',
  warningBg: '#FFF6D9',
  success: '#257552',
  badgeDot: '#E5484D',
  disabledBg: '#E3EAE6',
  disabledText: '#8C978F',
  scrim: 'rgba(20,40,32,0.32)',
  glassStrong: 'rgba(255,255,255,0.94)',
  toastBg: 'rgba(20,56,44,0.94)',
  onToast: '#FFFFFF',
} as const;

export const darkColors = {
  green950: '#14382C',
  green900: '#265F4D',
  green700: '#2E8A64',
  green600: '#1FA971',
  mint500: '#5BBE97',
  mint100: '#E8F5EE',
  mintOnDark: '#BFE6D3',
  mintOnDark2: '#E1F2EA',
  yellowHighlight: '#FFE27A',
  bg: '#0F1714',
  surface: '#17221E',
  surfaceSub: '#1D2A25',
  surfaceMint: '#18342A',
  border: '#2A3A33',
  borderControl: '#5C7268',
  text: '#E8F0EC',
  text2: '#C3D0CA',
  text3: '#A3B2AB',
  text4: '#8FA099',
  textAccent: '#7FD0AE',
  primary: '#5BBE97',
  primaryHover: '#6CC7A3',
  primaryPressed: '#7FD0AE',
  onPrimary: '#0F2A20',
  focusRing: '#7FD0AE',
  error: '#F08A80',
  errorBg: '#3A1F1C',
  warning: '#E8C15A',
  warningBg: '#362C10',
  success: '#7FD0AE',
  badgeDot: '#FF6B6E',
  disabledBg: '#26332E',
  disabledText: '#66756E',
  scrim: 'rgba(0,0,0,0.56)',
  glassStrong: 'rgba(29,42,37,0.94)',
  toastBg: 'rgba(232,240,236,0.96)',
  onToast: '#14382C',
} as const;

export type MallyColors = typeof lightColors;

export const spacing = {shair: 2, s1: 4, s2: 8, s3: 12, s4: 16, s5: 20, s6: 24, s8: 32, s10: 40} as const;
export const radius = {xs: 8, sm: 12, md: 16, lg: 20, xl: 24, sheet: 28, pill: 999} as const;
export const size = {touchMin: 48, icon: 24, buttonHeight: 56, buttonHeightSm: 48, inputHeight: 56, appbarHeight: 52, tabbarHeight: 64, adminSidebarWidth: 240} as const;
export const duration = {fast: 150, exit: 240, enter: 380, celebrate: 600} as const;
/** Reanimated Easing.bezier(...)에 그대로 넣는다 */
export const easing = {enter: [0.32, 0.72, 0, 1] as const, exit: [0.4, 0, 1, 1] as const, standard: [0.22, 1, 0.36, 1] as const, springSoft: [0.34, 1.2, 0.64, 1] as const};

/** Pretendard를 앱에 포함하고 fontFamily 이름을 맞춘다. 굵기별 파일을 쓰면 fontFamily를 굵기마다 바꾼다 */
export const fontFamily = Platform.select({ ios: 'Pretendard', android: 'Pretendard', default: 'Pretendard' });
export const typography = {
  display: { fontFamily, fontSize: 32, lineHeight: 42, fontWeight: '800' as const, letterSpacing: -0.64 },
  titleLg: { fontFamily, fontSize: 24, lineHeight: 32, fontWeight: '800' as const, letterSpacing: -0.48 },
  title: { fontFamily, fontSize: 20, lineHeight: 28, fontWeight: '700' as const, letterSpacing: -0.4 },
  headline: { fontFamily, fontSize: 18, lineHeight: 26, fontWeight: '700' as const, letterSpacing: 0 },
  bodyLg: { fontFamily, fontSize: 17, lineHeight: 26, fontWeight: '400' as const, letterSpacing: 0 },
  body: { fontFamily, fontSize: 16, lineHeight: 24, fontWeight: '400' as const, letterSpacing: 0 },
  label: { fontFamily, fontSize: 15, lineHeight: 22, fontWeight: '600' as const, letterSpacing: 0 },
  caption: { fontFamily, fontSize: 14, lineHeight: 20, fontWeight: '500' as const, letterSpacing: 0 },
  labelSm: { fontFamily, fontSize: 13, lineHeight: 18, fontWeight: '700' as const, letterSpacing: 0 },
  button: { fontFamily, fontSize: 18, lineHeight: 24, fontWeight: '700' as const, letterSpacing: 0 },
  adminTitle: { fontFamily, fontSize: 24, lineHeight: 32, fontWeight: '700' as const, letterSpacing: 0 },
  adminHeadline: { fontFamily, fontSize: 17, lineHeight: 24, fontWeight: '700' as const, letterSpacing: 0 },
  adminBody: { fontFamily, fontSize: 15, lineHeight: 22, fontWeight: '400' as const, letterSpacing: 0 },
  adminCaption: { fontFamily, fontSize: 13, lineHeight: 18, fontWeight: '500' as const, letterSpacing: 0 },
} as const;

export const theme = { light: { colors: lightColors }, dark: { colors: darkColors }, spacing, radius, size, duration, easing, typography };
export default theme;
