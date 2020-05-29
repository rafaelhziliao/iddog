import UIKit

final class PhotoDetailSceneFactory {
    weak var sourceViewController: UIViewController?

    init(
        sourceViewController: UIViewController?
    ) {
        self.sourceViewController = sourceViewController
    }

    func make() {
        let viewController = PhotoDetailViewController()
        let interactor = PhotoDetailInteractor()
        let presenter = PhotoDetailPresenter()

        let worker = PhotoDetailWorker(
            imageLoaderService: NukeImageLoaderProvider()
        )

        viewController.interactor = interactor
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.viewController = viewController
        navigateToPhotoDetail(source: sourceViewController, destination: viewController)
    }

    func navigateToPhotoDetail(
        source: UIViewController?,
        destination: UIViewController
    ) {
        sourceViewController?.navigationController?.pushViewController(
            destination,
            animated: true
        )
    }

}
