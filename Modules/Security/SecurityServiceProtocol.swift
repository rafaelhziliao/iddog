import Foundation

public protocol SecurityServiceProtocol {
    func save(_ value: String, forKey key: String)
    func get(_ key: String) -> String?
    func clear() -> Bool
}
