import Foundation

protocol CategoriesDisplayLogic: class {
    func displayLogin()
}

extension CategoriesViewController: CategoriesDisplayLogic {
    func displayLogin() {
        router?.routeToLogin()
    }
}
