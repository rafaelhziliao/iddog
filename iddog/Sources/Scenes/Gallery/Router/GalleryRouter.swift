import UIKit

typealias GalleryRouterType = (GalleryRoutingLogic & GalleryDataPassing)

final class GalleryRouter {
    weak var viewController: GalleryViewController?
    var dataStore: GalleryDataStore?

    init() {}
}
