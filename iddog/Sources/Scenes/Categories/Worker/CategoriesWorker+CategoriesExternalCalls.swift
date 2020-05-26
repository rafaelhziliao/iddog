import Foundation

protocol CategoriesExternalCalls {
    func clearCredentials()
    func fecthCategories(result: @escaping (CategoriesModel) -> Void)
}

extension CategoriesWorker: CategoriesExternalCalls {
    func clearCredentials() {
        credentialStorage.clear()
    }

    func fecthCategories(result: @escaping (CategoriesModel) -> Void) {
        let categories: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            ),
            CategoryModel(
                name: "hound",
                hasPhoto: true
            ),
            CategoryModel(
                name: "pug",
                hasPhoto: true
            ),
            CategoryModel(
                name: "labrador",
                hasPhoto: true
            )

        ]
        result(categories)
    }

}
