import UIKit

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
