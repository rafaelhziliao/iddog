import UIKit

final class PhotoDetailSceneFactory {
    weak var sourceViewController: UIViewController?
    private let galleryDataStore: GalleryDataStore

    init(
        sourceViewController: UIViewController?,
        galleryDataStore: GalleryDataStore
    ) {
        self.sourceViewController = sourceViewController
        self.galleryDataStore = galleryDataStore
    }

    func make() {
        let viewController = PhotoDetailViewController()
        let interactor = PhotoDetailInteractor()
        let presenter = PhotoDetailPresenter()
        let router = PhotoDetailRouter()

        let worker = PhotoDetailWorker(
            imageLoaderService: NukeImageLoaderProvider()
        )

        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        var destinationDS = viewController.router!.dataStore!
        passDataToPhotoDetail(source: galleryDataStore, destination: &destinationDS)
        navigateToPhotoDetail(source: sourceViewController, destination: viewController)
    }

    func passDataToPhotoDetail(
        source: GalleryDataStore,
        destination: inout PhotoDetailDataStore
    ) {
        destination.imageURL = source.imageURL
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
