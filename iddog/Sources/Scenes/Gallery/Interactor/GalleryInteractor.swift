import UIKit

protocol GalleryDataStore {
    var categoryName: String { get set }
    var imageURL: URL? { get set }
}

final class GalleryInteractor: GalleryDataStore {
    var presenter: GalleryPresentationLogic?
    var worker: GalleryExternalCalls?
    var categoryName: String = ""
    var imageURL: URL?
}
