import Foundation

protocol PhotoDetailBusinessLogic {
    func downloadImage(from url: URL)
}

final class PhotoDetailInteractor {
    var presenter: PhotoDetailPresentationLogic?
    var worker: PhotoDetailExternalCalls?
}

extension PhotoDetailInteractor: PhotoDetailBusinessLogic {
    func downloadImage(from url: URL) {
        worker?.fetchImage(from: url) { [weak self] result in
            switch result {
            case let .success(image):
                self?.presenter?.presentDownloadedImage(image)
            case .failure:
                self?.presenter?.presentImageError()
            }
        }
    }
}
