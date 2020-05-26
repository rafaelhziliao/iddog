import Foundation

typealias CategoriesModel = [CategoryModel]

struct CategoryModel: CategoryProtocol {
    let name: String
    let hasPhoto: Bool
}

extension CategoryModel: Decodable {}
