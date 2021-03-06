import Foundation

protocol GalleryCollectionViewCellExternalCalls {
    func fetchImage(from url: URL, result: @escaping ResulImageHandler)
    func cancelDownload()
}

final class GalleryCollectionViewCellWorker {
    let imageLoaderService: ImageLoaderServiceProtocol

    init(
        imageLoaderService: ImageLoaderServiceProtocol
    ) {
        self.imageLoaderService = imageLoaderService
    }
}

extension GalleryCollectionViewCellWorker: GalleryCollectionViewCellExternalCalls {
    func fetchImage(from url: URL, result: @escaping ResulImageHandler) {

        imageLoaderService.downloadImage(with: url) { response in
            switch response {
            case let .success(image):
                result(.success(image))
            case let .failure(error):
                result(.failure(error))
            }
        }
    }

    func cancelDownload() {
        imageLoaderService.cancelDownload()
    }
}
