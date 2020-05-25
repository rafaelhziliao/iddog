import UIKit

protocol LoginRoutingLogic {
    func routeToAlert(_ alert: UIAlertController)
    func dismiss()
}

extension LoginRouter: LoginRoutingLogic {
    func routeToAlert(_ alert: UIAlertController) {
        showAlert(alert)
    }

    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }
}
