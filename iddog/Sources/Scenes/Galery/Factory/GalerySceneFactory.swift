import UIKit

final class GalerySceneFactory {
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
        let viewController = GaleryViewController()
        let interactor = GaleryInteractor()
        let presenter = GaleryPresenter()
        let router = GaleryRouter()

        let worker = GaleryWorker(
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
        passDataToGalery(source: categoryDataStore, destination: &destinationDS)
        navigateToGalery(source: sourceViewController, destination: viewController)
    }

    func passDataToGalery(
        source: CategoriesDataStore,
        destination: inout GaleryDataStore
    ) {
        destination.categoryName = source.categoryName
    }

    func navigateToGalery(
        source: UIViewController?,
        destination: UIViewController
    ) {
        sourceViewController?.navigationController?.pushViewController(
            destination,
            animated: true
        )
    }
}
