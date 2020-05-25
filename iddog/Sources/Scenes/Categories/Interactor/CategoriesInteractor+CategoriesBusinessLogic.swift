import Foundation

protocol CategoriesBusinessLogic {
    func logout()
}

extension CategoriesInteractor: CategoriesBusinessLogic {
    func logout() {
        worker?.clearCredentials()
        presenter?.presentLogin()
    }
}
