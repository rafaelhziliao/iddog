import UIKit

typealias LoginRouterType = (LoginRoutingLogic & LoginDataPassing)

final class LoginRouter: RootSceneType, RouterShowAlert {
    weak var viewController: UIViewController?
    var dataStore: LoginDataStore?
    unowned let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }
}
