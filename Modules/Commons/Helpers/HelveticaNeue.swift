import UIKit

public enum HelveticaNeue: String, CustomFont, CaseIterable {
    case regular = ""
    case bold = "-Bold"
    case boldItalic = "-BoldItalic"
    case condensedBlack = "-CondensedBlack"
    case condesedBold = "-CondensedBold"
    case italic = "-Italic"
    case light = "-Light"
    case lightItalic = "-LightItalic"
    case medium = "-Medium"
    case mediumItalic = "=MediumItalic"
    case thin = "-Thin"
    case thinItalic = "-ThinItalic"
    case ultraLight = "-UltraLight"
    case ultraLightItalic = "-UltraLightItalic"

    public var familyName: String {
        return "HelveticaNeue"
    }

    public var registeredFontName: String {
        return "HelveticaNeue\(rawValue)"
    }

    public func withSize(_ size: CGFloat) -> UIFont {
        return FontHelper.font(for: self, and: size)
    }
}
