import UIKit

final class MainSceneFactory {
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

        window.rootViewController = viewController
    }
}
