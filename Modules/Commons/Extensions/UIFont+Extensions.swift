import UIKit

public extension UIFont {
    static func nonNilFont(name fontName: String, size fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: fontName, size: fontSize) else {
            fatalError("\(fontName) was not found, it need to be register at CTFontManager.")
        }
        return font
    }
}
