import UIKit

typealias CategoriesRouterType = (CategoriesRoutingLogic & CategoriesDataPassing)

final class CategoriesRouter: RootSceneType, RouterShowAlert {
    weak var viewController: UIViewController?
    unowned let window: UIWindow
    var dataStore: CategoriesDataStore?

    init(window: UIWindow) {
        self.window = window
    }
}
