import UIKit

protocol PhotoDetailDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayImageError(_ errorImage: UIImage?)
}

extension PhotoDetailViewController: PhotoDetailDisplayLogic, FullScreenLoader {
    func displayDownloadedImage(_ image: UIImage) {
        showLoading(false)
        imageView.image = image
    }

    func displayImageError(_ errorImage: UIImage?) {
        showLoading(false)
        imageView.image = errorImage
    }
}
