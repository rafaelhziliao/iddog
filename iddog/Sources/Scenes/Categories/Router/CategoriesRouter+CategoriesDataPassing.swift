import Foundation

protocol CategoriesDataPassing {
    var dataStore: CategoriesDataStore? { get }
}

extension CategoriesRouter: CategoriesDataPassing {}
