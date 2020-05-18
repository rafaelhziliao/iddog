import UIKit

typealias RoutingLogic = (MainRoutingLogic & MainDataPassing)

protocol MainRoutingLogic {}

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

extension MainRouter: MainRoutingLogic {}

extension MainRouter: MainDataPassing {}
