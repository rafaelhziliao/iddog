import Foundation

protocol MainPresentationLogic {
    func presentCategories()
    func presentLogin()
}

extension MainPresenter: MainPresentationLogic {
    func presentCategories() {

    }

    func presentLogin() {
        viewController?.displayLogin()
    }
}
