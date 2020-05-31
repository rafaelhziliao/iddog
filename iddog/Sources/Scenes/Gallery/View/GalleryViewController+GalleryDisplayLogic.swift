import UIKit

protocol GalleryDisplayLogic: class {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol)
    func displayErrorMessageOnGetGalleryData(_ error: NetworkError)
    func displayPhotoDetail()
}

extension GalleryViewController: GalleryDisplayLogic, Alertable, FullScreenLoader {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol) {
        showLoading(false)
        galleryData = categoryGallery
        title = categoryGallery.name
    }

    func displayErrorMessageOnGetGalleryData(_ error: NetworkError) {
        let retryAction: ((UIAlertAction) -> Void) = { [weak self] action in
            self?.interactor?.getLinkList()
        }

        let cancelAction: ((UIAlertAction) -> Void) = { [weak self] action in
            self?.router?.dismissAlert()
        }

        let alert = alertWithRetry(
            retryAction,
            cancelAction,
            for: error
        )
        router?.routeToAlert(alert)
    }

    func displayPhotoDetail() {
        router?.routeToPhotoDetail()
    }
}
