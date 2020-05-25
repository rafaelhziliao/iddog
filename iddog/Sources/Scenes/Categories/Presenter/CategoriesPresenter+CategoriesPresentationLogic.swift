import Foundation

protocol CategoriesPresentationLogic {
    func presentLogin()
}

extension CategoriesPresenter: CategoriesPresentationLogic {
    func presentLogin() {
        viewController?.displayLogin()
    }
}
