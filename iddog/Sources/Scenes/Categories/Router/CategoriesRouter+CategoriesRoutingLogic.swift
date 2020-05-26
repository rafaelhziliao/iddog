import UIKit

protocol CategoriesRoutingLogic {
    func routeToLogin()
    func routeToLogoutConfirmation(_ alert: UIAlertController)
    func dismissLogoutAlert()
}

extension CategoriesRouter: CategoriesRoutingLogic {
    func routeToLogin() {
        let loginScene = LoginSceneFactory(window: window)
        loginScene.make()
    }

    func routeToLogoutConfirmation(_ alert: UIAlertController) {
        showAlert(alert)
    }

    func dismissLogoutAlert() {
        viewController?.dismiss(animated: true, completion: nil)
    }

}
