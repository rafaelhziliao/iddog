import UIKit

final class GallerySceneFactory {
    private let categoryDataStore: CategoriesDataStore
    weak var sourceViewController: UIViewController?

    init(
        sourceViewController: UIViewController?,
        categoryDataStore: CategoriesDataStore
    ) {
        self.sourceViewController = sourceViewController
        self.categoryDataStore = categoryDataStore
    }

    func make() {
        let viewController = GalleryViewController()
        let interactor = GalleryInteractor()
        let presenter = GalleryPresenter()
        let router = GalleryRouter()

        let worker = GalleryWorker(
            network: URLSessionProvider(),
            credentialStorage: CredentialStorage()
        )

        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        var destinationDS = viewController.router!.dataStore!
        passDataToGallery(source: categoryDataStore, destination: &destinationDS)
        navigateToGallery(source: sourceViewController, destination: viewController)
    }

    func passDataToGallery(
        source: CategoriesDataStore,
        destination: inout GalleryDataStore
    ) {
        destination.categoryName = source.categoryName
    }

    func navigateToGallery(
        source: UIViewController?,
        destination: UIViewController
    ) {
        sourceViewController?.navigationController?.pushViewController(
            destination,
            animated: true
        )
    }
}
