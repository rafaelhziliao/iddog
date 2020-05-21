import UIKit

protocol LoginExternalServices {}

final class LoginWorker {
    let network: NetworkProviderProtocol
    let credentialStorage: SecurityStorageProtocol

    init(
        network: NetworkProviderProtocol,
        credentialStorage: SecurityStorageProtocol
    ) {
        self.network = network
        self.credentialStorage = credentialStorage
    }
}

extension LoginWorker: LoginExternalServices {}
