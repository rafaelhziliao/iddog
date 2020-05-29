import UIKit

protocol GalleryPresentationLogic {
    func presentDownloadedImage(_ image: UIImage)
    func presentImageError()
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

    func presentDownloadedImage(_ image: UIImage) {
        viewController?.displayDownloadedImage(image)
    }

    func presentImageError() {
        let errorImage = R.image.downloadImageError()
        viewController?.displayImageError(errorImage)
    }
}
