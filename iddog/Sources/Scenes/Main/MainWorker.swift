import UIKit

protocol ExternalServices {
    func requestCrendentials(result: (String?) -> Void)
}

final class MainWorker {
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

extension MainWorker: ExternalServices {
    func requestCrendentials(result: (String?) -> Void) {
        guard let token = credentialStorage.getAccessTokenSync() else {
            return result(nil)
        }
        result(token)
    }
}
