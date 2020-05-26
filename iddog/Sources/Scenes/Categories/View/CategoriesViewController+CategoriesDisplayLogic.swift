import UIKit

protocol CategoriesDisplayLogic: class {
    func displayLogin()
    func displayLogoutConfirmation()
}

extension CategoriesViewController: CategoriesDisplayLogic, Alertable {
    func displayLogin() {
        router?.routeToLogin()
    }

    func displayLogoutConfirmation() {
        let yesAction: ((UIAlertAction) -> Void) = { action in
            self.interactor?.logout()
        }

        let noAction: ((UIAlertAction) -> Void) = { action in
            self.router?.dismissLogoutAlert()
        }

        let alert = alertWithActions(
            title: R.string.localizable.logoutMessageTitle(),
            message: R.string.localizable.logoutMessage(),
            actions: [
                R.string.localizable.no(),
                R.string.localizable.yes()
            ],
            handlers: [
                noAction,
                yesAction
            ]
        )

        router?.routeToLogoutConfirmation(alert)
    }
}
