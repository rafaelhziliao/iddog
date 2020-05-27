import Foundation

protocol CategoriesBusinessLogic {
    func logout()
    func fetchCategories()
    func setCategoryNameOnDataStore(_ name: String)
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

    func setCategoryNameOnDataStore(_ name: String) {
        self.categoryName = name
        presenter?.presentCategoryGallery()
    }
}
