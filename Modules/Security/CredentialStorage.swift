import Foundation
import KeychainSwift

public final class CredentialStorage: SecurityStorageProtocol {
    struct Keys {
        static let authorizationKey = "Authorization"
    }

    public let service: SecurityServiceProtocol
    private let queue = DispatchQueue(label: "credentialstorage.privatequeue")

    init(service: SecurityServiceProtocol = KeychainSwift()) {
        self.service = service
    }

    var authorizationValue: String? {
        get {
            return service.get(Keys.authorizationKey)
        }
        set {
            service.save(newValue ?? "", forKey: Keys.authorizationKey)
        }
    }

    public func getAccessTokenSync() -> String? {
        return queue.sync {
            return self.authorizationValue
        }
    }

    public func setAccessTokenAsync(_ token: String?) {
        queue.async {
            self.authorizationValue = token
        }
    }

    public func clear() {
        _ = service.clear()
    }
}
