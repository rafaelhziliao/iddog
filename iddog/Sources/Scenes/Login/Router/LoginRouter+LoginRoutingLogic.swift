import UIKit

protocol LoginRoutingLogic {
    func routeToAlert(_ alert: UIAlertController)
    func dismiss()
    func routeToCategories()
}

extension LoginRouter: LoginRoutingLogic {
    func routeToCategories() {
        let categoriesScene = CategoriesSceneFactory(window: window)
        categoriesScene.make()
    }

    func routeToAlert(_ alert: UIAlertController) {
        showAlert(alert)
    }

    func dismiss() {
        viewController?.dismiss(animated: true, completion: nil)
    }

}
