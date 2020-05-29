import UIKit

protocol GalleryRoutingLogic {
    func dismissAlert()
    func routeToAlert(_ alert: UIAlertController)
    func routeToPhotoDetail()
}

extension GalleryRouter: GalleryRoutingLogic {
    func dismissAlert() {
        viewController?.dismiss(animated: true, completion: nil)
    }

    func routeToAlert(_ alert: UIAlertController) {
        showAlert(alert)
    }

    func routeToPhotoDetail() {
        let photoDetailScene = PhotoDetailSceneFactory(sourceViewController: viewController)
        photoDetailScene.make()
    }
}
