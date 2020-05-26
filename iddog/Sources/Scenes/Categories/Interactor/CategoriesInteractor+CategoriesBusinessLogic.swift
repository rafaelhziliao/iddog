import Foundation

protocol CategoriesBusinessLogic {
    func logout()
    func fetchCategories()
}

extension CategoriesInteractor: CategoriesBusinessLogic {
    func logout() {
        worker?.clearCredentials()
        presenter?.presentLogin()
    }

    func fetchCategories() {
        worker?.fecthCategories(result: { [weak self] categories in
            self?.presenter?.presentCategories(categories)
        })
    }

}
