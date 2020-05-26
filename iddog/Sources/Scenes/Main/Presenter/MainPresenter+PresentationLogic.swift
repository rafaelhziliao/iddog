import Foundation

protocol MainPresentationLogic {
    func presentCategories()
    func presentLogin()
}

extension MainPresenter: MainPresentationLogic {
    func presentCategories() {
        viewController?.displayCategories()
    }

    func presentLogin() {
        viewController?.displayLogin()
    }
}
