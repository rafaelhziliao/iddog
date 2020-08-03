import UIKit

final class MainSceneFactory: RootSceneType {
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func make() {
        let viewController = MainViewController()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter(window: window)

        let worker = MainWorker(
            credentialStorage: CredentialStorage()
        )

        viewController.interactor = interactor
        viewController.router = router
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor

        let navigation = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigation
    }
}
