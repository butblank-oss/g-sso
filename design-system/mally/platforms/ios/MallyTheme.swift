// 맬리 디자인 시스템 — tokens.json에서 자동 생성. 직접 고치지 말고 scripts/build_platforms.py를 다시 실행하세요.
import SwiftUI
import UIKit

private func dynamic(_ light: UIColor, _ dark: UIColor) -> Color {
    Color(UIColor { $0.userInterfaceStyle == .dark ? dark : light })
}

public enum MallyColor {
    public static let green950 = dynamic(UIColor(red: 0.0784, green: 0.2196, blue: 0.1725, alpha: 1), UIColor(red: 0.0784, green: 0.2196, blue: 0.1725, alpha: 1))
    public static let green900 = dynamic(UIColor(red: 0.1490, green: 0.3725, blue: 0.3020, alpha: 1), UIColor(red: 0.1490, green: 0.3725, blue: 0.3020, alpha: 1))
    public static let green700 = dynamic(UIColor(red: 0.1804, green: 0.5412, blue: 0.3922, alpha: 1), UIColor(red: 0.1804, green: 0.5412, blue: 0.3922, alpha: 1))
    public static let green600 = dynamic(UIColor(red: 0.1216, green: 0.6627, blue: 0.4431, alpha: 1), UIColor(red: 0.1216, green: 0.6627, blue: 0.4431, alpha: 1))
    public static let mint500 = dynamic(UIColor(red: 0.3569, green: 0.7451, blue: 0.5922, alpha: 1), UIColor(red: 0.3569, green: 0.7451, blue: 0.5922, alpha: 1))
    public static let mint100 = dynamic(UIColor(red: 0.9098, green: 0.9608, blue: 0.9333, alpha: 1), UIColor(red: 0.9098, green: 0.9608, blue: 0.9333, alpha: 1))
    public static let mintOnDark = dynamic(UIColor(red: 0.7490, green: 0.9020, blue: 0.8275, alpha: 1), UIColor(red: 0.7490, green: 0.9020, blue: 0.8275, alpha: 1))
    public static let mintOnDark2 = dynamic(UIColor(red: 0.8824, green: 0.9490, blue: 0.9176, alpha: 1), UIColor(red: 0.8824, green: 0.9490, blue: 0.9176, alpha: 1))
    public static let yellowHighlight = dynamic(UIColor(red: 1.0000, green: 0.8863, blue: 0.4784, alpha: 1), UIColor(red: 1.0000, green: 0.8863, blue: 0.4784, alpha: 1))
    public static let bg = dynamic(UIColor(red: 0.9059, green: 0.9255, blue: 0.9137, alpha: 1), UIColor(red: 0.0588, green: 0.0902, blue: 0.0784, alpha: 1))
    public static let surface = dynamic(UIColor(red: 1.0000, green: 1.0000, blue: 1.0000, alpha: 1), UIColor(red: 0.0902, green: 0.1333, blue: 0.1176, alpha: 1))
    public static let surfaceSub = dynamic(UIColor(red: 0.9529, green: 0.9647, blue: 0.9569, alpha: 1), UIColor(red: 0.1137, green: 0.1647, blue: 0.1451, alpha: 1))
    public static let surfaceMint = dynamic(UIColor(red: 0.9098, green: 0.9608, blue: 0.9333, alpha: 1), UIColor(red: 0.0941, green: 0.2039, blue: 0.1647, alpha: 1))
    public static let border = dynamic(UIColor(red: 0.8353, green: 0.8745, blue: 0.8549, alpha: 1), UIColor(red: 0.1647, green: 0.2275, blue: 0.2000, alpha: 1))
    public static let borderControl = dynamic(UIColor(red: 0.4706, green: 0.5608, blue: 0.5137, alpha: 1), UIColor(red: 0.3608, green: 0.4471, blue: 0.4078, alpha: 1))
    public static let text = dynamic(UIColor(red: 0.1176, green: 0.1686, blue: 0.1490, alpha: 1), UIColor(red: 0.9098, green: 0.9412, blue: 0.9255, alpha: 1))
    public static let text2 = dynamic(UIColor(red: 0.2431, green: 0.2980, blue: 0.2745, alpha: 1), UIColor(red: 0.7647, green: 0.8157, blue: 0.7922, alpha: 1))
    public static let text3 = dynamic(UIColor(red: 0.3333, green: 0.3882, blue: 0.3647, alpha: 1), UIColor(red: 0.6392, green: 0.6980, blue: 0.6706, alpha: 1))
    public static let text4 = dynamic(UIColor(red: 0.3686, green: 0.4196, blue: 0.3961, alpha: 1), UIColor(red: 0.5608, green: 0.6275, blue: 0.6000, alpha: 1))
    public static let textAccent = dynamic(UIColor(red: 0.1451, green: 0.4588, blue: 0.3216, alpha: 1), UIColor(red: 0.4980, green: 0.8157, blue: 0.6824, alpha: 1))
    public static let primary = dynamic(UIColor(red: 0.1490, green: 0.3725, blue: 0.3020, alpha: 1), UIColor(red: 0.3569, green: 0.7451, blue: 0.5922, alpha: 1))
    public static let primaryHover = dynamic(UIColor(red: 0.1765, green: 0.4196, blue: 0.3412, alpha: 1), UIColor(red: 0.4235, green: 0.7804, blue: 0.6392, alpha: 1))
    public static let primaryPressed = dynamic(UIColor(red: 0.0784, green: 0.2196, blue: 0.1725, alpha: 1), UIColor(red: 0.4980, green: 0.8157, blue: 0.6824, alpha: 1))
    public static let onPrimary = dynamic(UIColor(red: 1.0000, green: 1.0000, blue: 1.0000, alpha: 1), UIColor(red: 0.0588, green: 0.1647, blue: 0.1255, alpha: 1))
    public static let focusRing = dynamic(UIColor(red: 0.1804, green: 0.5412, blue: 0.3922, alpha: 1), UIColor(red: 0.4980, green: 0.8157, blue: 0.6824, alpha: 1))
    public static let error = dynamic(UIColor(red: 0.7216, green: 0.2824, blue: 0.2431, alpha: 1), UIColor(red: 0.9412, green: 0.5412, blue: 0.5020, alpha: 1))
    public static let errorBg = dynamic(UIColor(red: 0.9843, green: 0.9373, blue: 0.9294, alpha: 1), UIColor(red: 0.2275, green: 0.1216, blue: 0.1098, alpha: 1))
    public static let warning = dynamic(UIColor(red: 0.5412, green: 0.3922, blue: 0.0000, alpha: 1), UIColor(red: 0.9098, green: 0.7569, blue: 0.3529, alpha: 1))
    public static let warningBg = dynamic(UIColor(red: 1.0000, green: 0.9647, blue: 0.8510, alpha: 1), UIColor(red: 0.2118, green: 0.1725, blue: 0.0627, alpha: 1))
    public static let success = dynamic(UIColor(red: 0.1451, green: 0.4588, blue: 0.3216, alpha: 1), UIColor(red: 0.4980, green: 0.8157, blue: 0.6824, alpha: 1))
    public static let badgeDot = dynamic(UIColor(red: 0.8980, green: 0.2824, blue: 0.3020, alpha: 1), UIColor(red: 1.0000, green: 0.4196, blue: 0.4314, alpha: 1))
    public static let disabledBg = dynamic(UIColor(red: 0.8902, green: 0.9176, blue: 0.9020, alpha: 1), UIColor(red: 0.1490, green: 0.2000, blue: 0.1804, alpha: 1))
    public static let disabledText = dynamic(UIColor(red: 0.5490, green: 0.5922, blue: 0.5608, alpha: 1), UIColor(red: 0.4000, green: 0.4588, blue: 0.4314, alpha: 1))
    public static let scrim = dynamic(UIColor(red: 0.0784, green: 0.1569, blue: 0.1255, alpha: 0.32), UIColor(red: 0.0000, green: 0.0000, blue: 0.0000, alpha: 0.56))
    public static let glassStrong = dynamic(UIColor(red: 1.0000, green: 1.0000, blue: 1.0000, alpha: 0.94), UIColor(red: 0.1137, green: 0.1647, blue: 0.1451, alpha: 0.94))
    public static let toastBg = dynamic(UIColor(red: 0.0784, green: 0.2196, blue: 0.1725, alpha: 0.94), UIColor(red: 0.9098, green: 0.9412, blue: 0.9255, alpha: 0.96))
    public static let onToast = dynamic(UIColor(red: 1.0000, green: 1.0000, blue: 1.0000, alpha: 1), UIColor(red: 0.0784, green: 0.2196, blue: 0.1725, alpha: 1))
}

public enum MallySpacing {public static let shair: CGFloat = 2; public static let s1: CGFloat = 4; public static let s2: CGFloat = 8; public static let s3: CGFloat = 12; public static let s4: CGFloat = 16; public static let s5: CGFloat = 20; public static let s6: CGFloat = 24; public static let s8: CGFloat = 32; public static let s10: CGFloat = 40;}
public enum MallyRadius {public static let xs: CGFloat = 8; public static let sm: CGFloat = 12; public static let md: CGFloat = 16; public static let lg: CGFloat = 20; public static let xl: CGFloat = 24; public static let sheet: CGFloat = 28; public static let pill: CGFloat = 999;}
public enum MallySize {public static let touchMin: CGFloat = 48; public static let icon: CGFloat = 24; public static let buttonHeight: CGFloat = 56; public static let buttonHeightSm: CGFloat = 48; public static let inputHeight: CGFloat = 56; public static let appbarHeight: CGFloat = 52; public static let tabbarHeight: CGFloat = 64; public static let adminSidebarWidth: CGFloat = 240;}
public enum MallyMotion {public static let fast: Double = 0.15; public static let exit: Double = 0.24; public static let enter: Double = 0.38; public static let celebrate: Double = 0.6; public static let enter = Animation.timingCurve(0.32, 0.72, 0, 1, duration: 0.38); public static let exit = Animation.timingCurve(0.4, 0, 1, 1, duration: 0.38); public static let standard = Animation.timingCurve(0.22, 1, 0.36, 1, duration: 0.38); public static let springSoft = Animation.timingCurve(0.34, 1.2, 0.64, 1, duration: 0.38);}

public struct MallyTextStyle { public let size: CGFloat; public let lineHeight: CGFloat; public let weight: Font.Weight; public let tracking: CGFloat }
public enum MallyText {
    public static let display = MallyTextStyle(size: 32, lineHeight: 42, weight: .heavy, tracking: -0.64)
    public static let titleLg = MallyTextStyle(size: 24, lineHeight: 32, weight: .heavy, tracking: -0.48)
    public static let title = MallyTextStyle(size: 20, lineHeight: 28, weight: .bold, tracking: -0.4)
    public static let headline = MallyTextStyle(size: 18, lineHeight: 26, weight: .bold, tracking: 0)
    public static let bodyLg = MallyTextStyle(size: 17, lineHeight: 26, weight: .regular, tracking: 0)
    public static let body = MallyTextStyle(size: 16, lineHeight: 24, weight: .regular, tracking: 0)
    public static let label = MallyTextStyle(size: 15, lineHeight: 22, weight: .semibold, tracking: 0)
    public static let caption = MallyTextStyle(size: 14, lineHeight: 20, weight: .medium, tracking: 0)
    public static let labelSm = MallyTextStyle(size: 13, lineHeight: 18, weight: .bold, tracking: 0)
    public static let button = MallyTextStyle(size: 18, lineHeight: 24, weight: .bold, tracking: 0)
    public static let adminTitle = MallyTextStyle(size: 24, lineHeight: 32, weight: .bold, tracking: 0)
    public static let adminHeadline = MallyTextStyle(size: 17, lineHeight: 24, weight: .bold, tracking: 0)
    public static let adminBody = MallyTextStyle(size: 15, lineHeight: 22, weight: .regular, tracking: 0)
    public static let adminCaption = MallyTextStyle(size: 13, lineHeight: 18, weight: .medium, tracking: 0)
}

public extension View {
    /// Pretendard + 줄간격 적용. 시스템 글자 크기(Dynamic Type)를 따라 커지도록 relativeTo를 지정한다.
    func mallyText(_ s: MallyTextStyle, relativeTo: Font.TextStyle = .body) -> some View {
        self.font(.custom("Pretendard", size: s.size, relativeTo: relativeTo).weight(s.weight))
            .tracking(s.tracking)
            .lineSpacing(s.lineHeight - s.size)
    }
}
