import UIKit

typealias CategoriesRouterType = (CategoriesRoutingLogic & CategoriesDataPassing)

final class CategoriesRouter: RootSceneType {
    weak var viewController: CategoriesViewController?
    unowned let window: UIWindow
    var dataStore: CategoriesDataStore?

    init(window: UIWindow) {
        self.window = window
    }
}
