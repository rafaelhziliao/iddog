import UIKit

protocol GalleryDisplayLogic: class {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol)
    func displayErrorMessageOnGetGalleryData(_ error: NetworkError)
}

extension GalleryViewController: GalleryDisplayLogic, Alertable {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol) {
        DispatchQueue.main.async {
            self.title = categoryGallery.name
            self.galleryData = categoryGallery
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
}
