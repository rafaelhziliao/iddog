import UIKit

final class CategoriesSceneFactory: RootSceneType {
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func make() {
        let viewController = CategoriesViewController()
        let interactor = CategoriesInteractor()
        let presenter = CategoriesPresenter()
        let router = CategoriesRouter(window: window)

        let worker = CategoriesWorker(
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

        if let nav = window.rootViewController as? UINavigationController {
            nav.setViewControllers([viewController], animated: true)
            nav.isNavigationBarHidden = false
        }
    }
}
