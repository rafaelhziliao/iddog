import Foundation

struct CategoryGaleryModel: CategoryGaleryProtocol {
    let name: String
    let list: [URL]
}

extension CategoryGaleryModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "category"
        case list
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        list = try container.decode([URL].self, forKey: .list)
    }
}
