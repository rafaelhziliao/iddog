import Foundation

protocol GalleryCollectionViewCellBusinessLogic {
    func downloadImage(from url: URL)
}

final class GalleryCollectionViewCellInteractor {
    var presenter: GalleryCollectionViewCellPresentationLogic?
    var worker: GalleryCollectionViewCellExternalCalls?
}

extension GalleryCollectionViewCellInteractor: GalleryCollectionViewCellBusinessLogic {
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
