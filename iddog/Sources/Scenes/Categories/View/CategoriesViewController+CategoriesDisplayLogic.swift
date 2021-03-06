import UIKit

protocol CategoriesDisplayLogic: class {
    func displayLogin()
    func displayLogoutConfirmation()
    func displayCategories(_ categories: CategoriesModel)
    func displayCategoryGallery()
}

extension CategoriesViewController: CategoriesDisplayLogic, Alertable, FullScreenLoader {
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

    func displayCategories(_ categories: CategoriesModel) {
        showLoading(false)
        //didSet property observer
        self.categories = categories
    }

    func displayCategoryGallery() {
        router?.routeToCategoryGallery()
    }
}
