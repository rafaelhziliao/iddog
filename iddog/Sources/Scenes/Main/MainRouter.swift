import UIKit

typealias MainRouterType = (MainRoutingLogic & MainDataPassing)

protocol MainRoutingLogic {
    func routeToCategories()
    func routeToLogin()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter {
    weak var viewController: MainViewController?
    unowned let window: UIWindow
    var dataStore: MainDataStore?

    init(window: UIWindow) {
        self.window = window
    }
}

extension MainRouter: MainRoutingLogic {
    func routeToCategories() {}

    func routeToLogin() {
        let loginScene = LoginSceneFactory(window: window)
        loginScene.make()
    }
}

extension MainRouter: MainDataPassing {}
