import UIKit

typealias LoginRouterType = (LoginRoutingLogic & LoginDataPassing)

protocol LoginRoutingLogic {}

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

final class LoginRouter: RootSceneType {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
}

extension LoginRouter: LoginRoutingLogic {}

extension LoginRouter: LoginDataPassing {}