import UIKit

protocol GalleryPresentationLogic {
    func presentCategoryGallery(_ categoryGallery: CategoryGalleryProtocol)
    func presentErrorOnLoadGallery(_ error: NetworkError)
}

extension GalleryPresenter: GalleryPresentationLogic {
    func presentCategoryGallery(_ categoryGallery: CategoryGalleryProtocol) {
        viewController?.setCategoryGalleryData(categoryGallery)
    }

    func presentErrorOnLoadGallery(_ error: NetworkError) {
        viewController?.displayErrorMessageOnGetGalleryData(error)
    }
}
