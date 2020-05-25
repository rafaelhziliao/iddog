import Foundation

protocol MainDisplayLogic: class {
    func displayCategories()
    func displayLogin()
}

extension MainViewController: MainDisplayLogic {
    func displayCategories() {
        router?.routeToCategories()
    }

    func displayLogin() {
        router?.routeToLogin()
    }

}
