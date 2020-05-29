import UIKit

protocol GalleryDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayImageError(_ errorImage: UIImage?)
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol)
    func displayErrorMessageOnGetGalleryData(_ error: NetworkError)
}

extension GalleryViewController: GalleryDisplayLogic, Alertable {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol) {
        galleryData = categoryGallery
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

    func displayDownloadedImage(_ image: UIImage) {
        imageView.image = image
    }

    func displayImageError(_ errorImage: UIImage?) {
        imageView.image = errorImage
    }
}
