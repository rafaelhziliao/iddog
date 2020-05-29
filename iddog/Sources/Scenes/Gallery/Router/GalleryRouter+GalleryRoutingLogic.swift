import UIKit

protocol GalleryRoutingLogic {
    func dismissAlert()
    func routeToAlert(_ alert: UIAlertController)
}

extension GalleryRouter: GalleryRoutingLogic {
    func dismissAlert() {
        viewController?.dismiss(animated: true, completion: nil)
    }

    func routeToAlert(_ alert: UIAlertController) {
        showAlert(alert)
    }
}
