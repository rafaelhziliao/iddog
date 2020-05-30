import UIKit

protocol GalleryDisplayLogic: class {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol)
    func displayErrorMessageOnGetGalleryData(_ error: NetworkError)
    func displayPhotoDetail()
}

extension GalleryViewController: GalleryDisplayLogic, Alertable, FullScreenLoader {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol) {
        DispatchQueue.main.async {
            self.showLoading(false)
            self.galleryData = categoryGallery
            self.title = categoryGallery.name
        }
    }

    func displayErrorMessageOnGetGalleryData(_ error: NetworkError) {
        DispatchQueue.main.async {
            let retryAction: ((UIAlertAction) -> Void) = { action in
                self.interactor?.getLinkList()
            }

            let cancelAction: ((UIAlertAction) -> Void) = { action in
                self.router?.dismissAlert()
            }

            let alert = self.alertWithRetry(
                retryAction,
                cancelAction,
                for: error
            )
            self.router?.routeToAlert(alert)
        }
    }

    func displayPhotoDetail() {
        router?.routeToPhotoDetail()
    }
}
