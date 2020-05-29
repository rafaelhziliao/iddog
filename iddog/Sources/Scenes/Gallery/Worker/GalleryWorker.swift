import UIKit

final class GalleryWorker {
    let network: NetworkProviderProtocol
    let credentialStorage: SecurityStorageProtocol
    let imageLoaderService: ImageLoaderServiceProtocol

    init(
        network: NetworkProviderProtocol,
        credentialStorage: SecurityStorageProtocol,
        imageLoaderService: ImageLoaderServiceProtocol
    ) {
        self.network = network
        self.credentialStorage = credentialStorage
        self.imageLoaderService = imageLoaderService
    }
}
