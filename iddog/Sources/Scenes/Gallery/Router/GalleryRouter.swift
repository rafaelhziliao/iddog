import UIKit

typealias GalleryRouterType = (GalleryRoutingLogic & GalleryDataPassing)

final class GalleryRouter: RouterShowAlert {
    weak var viewController: UIViewController?
    var dataStore: GalleryDataStore?

    init() {}
}
