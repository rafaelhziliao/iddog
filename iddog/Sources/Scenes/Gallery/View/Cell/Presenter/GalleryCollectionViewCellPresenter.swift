import UIKit

protocol GalleryCollectionViewCellPresentationLogic {
    func presentDownloadedImage(_ image: UIImage)
    func presentImageError()
}

final class GalleryCollectionViewCellPresenter {
    weak var view: GalleryCollectionViewCellDisplayLogic?
}

extension GalleryCollectionViewCellPresenter: GalleryCollectionViewCellPresentationLogic {
    func presentDownloadedImage(_ image: UIImage) {
        view?.displayDownloadedImage(image)
    }

    func presentImageError() {
        let errorImage = R.image.downloadImageError()
        view?.displayImageError(errorImage)
    }
}
