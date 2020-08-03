import Foundation

protocol PhotoDetailExternalCalls {
    func fetchImage(from url: URL, result: @escaping ResulImageHandler)
}

extension PhotoDetailWorker: PhotoDetailExternalCalls {
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
}
