import Foundation

final class PhotoDetailWorker {
    let imageLoaderService: ImageLoaderServiceProtocol

    init(imageLoaderService: ImageLoaderServiceProtocol) {
        self.imageLoaderService = imageLoaderService
    }
}
