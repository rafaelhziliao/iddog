import UIKit

final class GalleryWorker {
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
