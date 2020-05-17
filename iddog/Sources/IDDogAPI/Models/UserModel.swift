import Foundation

struct UserModel: UserProtocol {
    let email: String
    let id: String
    let token: String
    let createdAt: String
    let updatedAt: String
    let version: Int
}

extension UserModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case email
        case id = "_id"
        case token, createdAt, updatedAt
        case version = "__v"
    }
}
