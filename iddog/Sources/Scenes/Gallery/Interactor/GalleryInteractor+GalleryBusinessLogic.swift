import Foundation

protocol GalleryBusinessLogic {
    func getLinkList()
    func storeImageURL(_ url: URL)
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

    func storeImageURL(_ url: URL) {
        self.imageURL = url
        presenter?.presentPhotoDetail()
    }
}
