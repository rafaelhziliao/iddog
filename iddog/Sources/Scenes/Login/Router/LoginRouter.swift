import UIKit

typealias LoginRouterType = (LoginRoutingLogic & LoginDataPassing)

final class LoginRouter: RootSceneType {
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
}
