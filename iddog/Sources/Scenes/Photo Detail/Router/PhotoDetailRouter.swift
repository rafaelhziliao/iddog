import UIKit

typealias PhotoDetailRouterType = (PhotoDetailRoutingLogic & PhotoDetailDataPassing)

protocol PhotoDetailDataPassing {
    var dataStore: PhotoDetailDataStore? { get }
}

protocol PhotoDetailRoutingLogic {}

final class PhotoDetailRouter: RouterShowAlert {
    weak var viewController: UIViewController?
    var dataStore: PhotoDetailDataStore?

    init() {}
}

extension PhotoDetailRouter: PhotoDetailRoutingLogic {}
extension PhotoDetailRouter: PhotoDetailDataPassing {}
