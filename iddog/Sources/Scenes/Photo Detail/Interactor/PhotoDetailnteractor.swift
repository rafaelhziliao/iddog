import Foundation

protocol PhotoDetailDataStore {
    var imageURL: URL? { get set}
}

final class PhotoDetailInteractor: PhotoDetailDataStore {
    var imageURL: URL?
    var presenter: PhotoDetailPresentationLogic?
    var worker: PhotoDetailExternalCalls?
}
