import UIKit

typealias MainRouterType = (MainRoutingLogic & MainDataPassing)

final class MainRouter: RootSceneType {
    weak var viewController: MainViewController?
    unowned let window: UIWindow
    var dataStore: MainDataStore?

    init(window: UIWindow) {
        self.window = window
    }
}
