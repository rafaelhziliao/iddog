import Foundation

protocol PhotoDetailDataStore {
    var imageURL: URL? { get set}
}

protocol PhotoDetailBusinessLogic {
    func downloadImage()
}

final class PhotoDetailInteractor: PhotoDetailDataStore {
    var imageURL: URL?
    var presenter: PhotoDetailPresentationLogic?
    var worker: PhotoDetailExternalCalls?
}

extension PhotoDetailInteractor: PhotoDetailBusinessLogic {
    func downloadImage() {
        guard
            let imageURL = imageURL
        else {
            presenter?.presentImageError()
            return
        }

        worker?.fetchImage(from: imageURL) { [weak self] result in
            switch result {
            case let .success(image):
                self?.presenter?.presentDownloadedImage(image)
            case .failure:
                self?.presenter?.presentImageError()
            }
        }
    }
}
