import UIKit

public protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable where Self: UIView {
    public static var identifier: String {
        return "\(Self.self)"
    }
}
