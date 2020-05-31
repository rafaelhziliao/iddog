import Foundation

protocol PhotoDetailBusinessLogic {
    func downloadImage()
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
