import Foundation

protocol CategoriesDataStore {}

final class CategoriesInteractor: CategoriesDataStore {
    var presenter: CategoriesPresentationLogic?
    var worker: CategoriesExternalCalls?
}
