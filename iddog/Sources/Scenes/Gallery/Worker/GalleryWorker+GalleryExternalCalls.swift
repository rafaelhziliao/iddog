import Foundation

protocol GalleryExternalCalls {
    func fetchImage(from url: URL, result: @escaping ResulImageHandler)
}

extension GalleryWorker: GalleryExternalCalls {
    func fetchImage(from url: URL, result: @escaping ResulImageHandler) {

        imageLoaderService.loadImage(with: url) { response in
            switch response {
            case let .success(image):
                result(.success(image))
            case let .failure(error):
                result(.failure(error))
            }
        }

    }

}
