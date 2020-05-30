import UIKit

protocol PhotoDetailPresentationLogic {
    func presentDownloadedImage(_ image: UIImage)
    func presentImageError()
}

extension PhotoDetailPresenter: PhotoDetailPresentationLogic {
    func presentDownloadedImage(_ image: UIImage) {
        viewController?.displayDownloadedImage(image)
    }

    func presentImageError() {
        let errorImage = R.image.downloadImageError()
        viewController?.displayImageError(errorImage)
    }
}
