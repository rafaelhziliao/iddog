import UIKit

typealias GaleryRouterType = (GaleryRoutingLogic & GaleryDataPassing)

final class GaleryRouter {
    weak var viewController: GaleryViewController?
    var dataStore: GaleryDataStore?

    init() {}
}
