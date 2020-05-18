import UIKit

typealias RoutingLogic = (MainRoutingLogic & MainDataPassing)

protocol MainRoutingLogic {
    func routeToCategories()
    func routeToLogin()
}

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

final class MainRouter: NSObject {
    weak var viewController: MainViewController?
    let dataStore: MainDataStore?

    init(dataStore: MainDataStore) {
        self.dataStore = dataStore
    }
}

extension MainRouter: MainRoutingLogic {
    func routeToCategories() {}

    func routeToLogin() {}
}

extension MainRouter: MainDataPassing {}
