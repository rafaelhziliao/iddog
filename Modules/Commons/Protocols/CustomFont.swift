import UIKit

public protocol CustomFont {
    var familyName: String { get }
    var registeredFontName: String { get }
    func withSize(_ size: CGFloat) -> UIFont
}
