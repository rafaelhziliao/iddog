import UIKit

protocol GalleryDataStore {
    var categoryName: String { get set }
}

final class GalleryInteractor: GalleryDataStore {
    var presenter: GalleryPresentationLogic?
    var worker: GalleryExternalCalls?
    var categoryName: String = ""
}
