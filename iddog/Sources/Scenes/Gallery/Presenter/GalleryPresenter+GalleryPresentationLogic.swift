import UIKit

protocol GalleryPresentationLogic {
    func presentDownloadedImage(_ image: UIImage)
    func presentErrorOnDownloadImage(_ error: Error)
}

extension GalleryPresenter: GalleryPresentationLogic {
    func presentDownloadedImage(_ image: UIImage) {
        viewController?.displayDownloadedImage(image)
    }

    func presentErrorOnDownloadImage(_ error: Error) {
        viewController?.displayErrorMessageOnDownloadImage(error)
    }
}
