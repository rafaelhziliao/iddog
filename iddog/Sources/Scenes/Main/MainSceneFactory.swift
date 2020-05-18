import UIKit

final class MainSceneFactory {
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func make() {
        let presenter = MainPresenter()

        let worker = MainWorker(
            network: URLSessionProvider(),
            credentialStorage: CredentialStorage()
        )

        let interactor = MainInteractor(
            presenter: presenter,
            worker: worker
        )

        let router = MainRouter(
            dataStore: interactor
        )

        let viewController = MainViewController(
            interactor: interactor,
            router: router
        )

        router.viewController = viewController
        presenter.viewController = viewController

        window.rootViewController = viewController
    }
}
