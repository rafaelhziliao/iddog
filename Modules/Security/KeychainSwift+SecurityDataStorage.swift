import Foundation
import KeychainSwift

extension KeychainSwift: SecurityServiceProtocol {
   public func save(_ value: String, forKey key: String) {
        set(value, forKey: key)
    }
}
