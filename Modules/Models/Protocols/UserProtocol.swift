import Foundation

protocol UserProtocol {
    var email: String { get }
    var id: String { get }
    var token: String { get }
    var createdAt: String { get }
    var updatedAt: String { get }
    var version: Int { get }
}
