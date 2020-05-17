import Foundation
import KeychainSwift

public final class CredentialStorage {
    struct Keys {
        static let authorizationKey = "Authorization"
    }

    static let shared = CredentialStorage()
    private let service: SecurityServiceProtocol
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

    func getAccessTokenSync() -> String? {
        return queue.sync {
            return self.authorizationValue
        }
    }

    func setAccessTokenAsync(_ token: String?) {
        queue.async {
            self.authorizationValue = token
        }
    }

    func clear() {
        _ = service.clear()
    }
}
