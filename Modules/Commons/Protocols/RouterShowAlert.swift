import UIKit

protocol RouterShowAlert {
    var viewController: UIViewController? { get }
    func showAlert(_ alert: UIAlertController)
}

extension RouterShowAlert {
    func showAlert(_ alert: UIAlertController) {
        viewController?.present(alert, animated: true)
    }
}
