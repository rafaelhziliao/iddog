import Foundation

protocol GalleryBusinessLogic {
    func getLinkList()
    func downloadImage(from url: URL)
}

extension GalleryInteractor: GalleryBusinessLogic {
    func getLinkList() {
        worker?.fetchGalleryData(for: categoryName) { [weak self] result in
            switch result {
            case let .success(categoryGallery):
                self?.presenter?.presentCategoryGallery(categoryGallery)
            case let .failure(error):
                self?.presenter?.presentErrorOnLoadGallery(error)
            }
        }
    }

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
