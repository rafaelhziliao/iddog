import UIKit

extension Array where Element == NSLayoutConstraint {
    func active() {
        NSLayoutConstraint.activate(self)
    }

    func deactive() {
        NSLayoutConstraint.deactivate(self)
    }
}
