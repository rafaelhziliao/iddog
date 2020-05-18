import UIKit

public protocol ViewCodable where Self: UIView {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func setupView()
}

extension ViewCodable where Self: UIView {
    public func setupView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }
}
