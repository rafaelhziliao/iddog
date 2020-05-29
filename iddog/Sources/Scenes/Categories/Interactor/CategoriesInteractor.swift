import Foundation

protocol CategoriesDataStore {
    var categoryName: String { get set}
}

final class CategoriesInteractor: CategoriesDataStore {
    var presenter: CategoriesPresentationLogic?
    var worker: CategoriesExternalCalls?
    var categoryName: String = ""
}
