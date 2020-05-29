import UIKit

typealias CategoriesRouterType = (CategoriesRoutingLogic & CategoriesDataPassing)

protocol CategoriesDataPassing {
    var dataStore: CategoriesDataStore? { get }
}

final class CategoriesRouter: RootSceneType, RouterShowAlert, CategoriesDataPassing {
    weak var viewController: UIViewController?
    unowned let window: UIWindow
    var dataStore: CategoriesDataStore?

    init(window: UIWindow) {
        self.window = window
    }
}
