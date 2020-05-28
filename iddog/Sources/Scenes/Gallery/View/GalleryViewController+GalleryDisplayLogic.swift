import UIKit

protocol GalleryDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayErrorMessageOnDownloadImage(_ error: Error)
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol)
    func displayErrorMessageOnGetGalleryData(_ error: NetworkError)
}

extension GalleryViewController: GalleryDisplayLogic {
    func setCategoryGalleryData(_ categoryGallery: CategoryGalleryProtocol) {
        galleryData = categoryGallery
    }

    func displayErrorMessageOnGetGalleryData(_ error: NetworkError) {
        print(error.messageToPresentToUser())
    }

    func displayDownloadedImage(_ image: UIImage) {
        imageView.image = image
    }
//TODO: Trocar para imagem de falha!!
    func displayErrorMessageOnDownloadImage(_ error: Error) {
        print("Deu Ruim!")
    }
}
