import UIKit

typealias PhotoDetailRouterType = (PhotoDetailDataPassing)

protocol PhotoDetailDataPassing {
    var dataStore: PhotoDetailDataStore? { get }
}

final class PhotoDetailRouter: PhotoDetailDataPassing, RouterShowAlert {
    weak var viewController: UIViewController?
    var dataStore: PhotoDetailDataStore?

    init() {}
}
