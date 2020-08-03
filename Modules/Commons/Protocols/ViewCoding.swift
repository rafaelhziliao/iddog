import UIKit

public protocol ViewCoding {
    func buildViewHierarchy()
    func setupConstraints()
    func additionalSetup()
    func buildView()
}

extension ViewCoding {
    public func buildView() {
        buildViewHierarchy()
        setupConstraints()
        additionalSetup()
    }

    public func additionalSetup() {}
}
