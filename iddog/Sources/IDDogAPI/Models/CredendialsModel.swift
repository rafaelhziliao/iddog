import Foundation

struct CredentialsModel: CrendentialsProtocol {
    let user: UserProtocol
}

extension CredentialsModel: Decodable {
    enum CodingKeys: String, CodingKey {
        case user
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        user = try container.decode(UserModel.self, forKey: .user)
    }
}
