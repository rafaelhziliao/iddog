import UIKit

final class LoginSceneFactory: RootSceneType {
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func make() {
        let viewController = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter(window: window)

        let worker = LoginWorker(
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
        }
    }
}
