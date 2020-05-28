import Foundation

protocol GalleryBusinessLogic {
    func downloadImage(from url: URL)
}

extension GalleryInteractor: GalleryBusinessLogic {
    func downloadImage(from url: URL) {
        worker?.fetchImage(from: url) { [weak self] result in
            switch result {
            case let .success(image):
                self?.presenter?.presentDownloadedImage(image)
            case let .failure(error):
                self?.presenter?.presentErrorOnDownloadImage(error)
            }
        }
    }
}
