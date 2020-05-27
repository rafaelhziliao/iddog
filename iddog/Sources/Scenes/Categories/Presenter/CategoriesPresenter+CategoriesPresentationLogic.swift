import Foundation

protocol CategoriesPresentationLogic {
    func presentLogin()
    func presentCategories(_ categories: CategoriesModel)
    func presentCategoryGallery()
}

extension CategoriesPresenter: CategoriesPresentationLogic {
    func presentLogin() {
        viewController?.displayLogin()
    }

    func presentCategories(_ categories: CategoriesModel) {
        viewController?.displayCategories(categories)
    }

    func presentCategoryGallery() {
        viewController?.displayCategoryGallery()
    }

}
