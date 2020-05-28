import UIKit

protocol GalleryDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayErrorMessageOnDownloadImage(_ error: Error)
}

extension GalleryViewController: GalleryDisplayLogic {
    func displayDownloadedImage(_ image: UIImage) {
        imageView.image = image
    }

    func displayErrorMessageOnDownloadImage(_ error: Error) {
        print("Deu Ruim!")
    }
}
