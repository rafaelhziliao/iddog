import UIKit

public protocol ViewCodable {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func buildView()
}

extension ViewCodable {
    public func buildView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }
}
