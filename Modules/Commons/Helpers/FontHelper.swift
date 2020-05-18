import UIKit

public class FontHelper {
    static func font(for font: CustomFont, and size: CGFloat) -> UIFont {
        return UIFont.nonNilFont(name: font.registeredFontName, size: size)
    }
}
