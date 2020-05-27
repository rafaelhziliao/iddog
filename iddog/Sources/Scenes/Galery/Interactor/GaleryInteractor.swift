import UIKit

protocol GaleryDataStore {
    var categoryName: String { get set }
}

final class GaleryInteractor: GaleryDataStore {
    var presenter: GaleryPresentationLogic?
    var worker: GaleryExternalCalls?
    var categoryName: String = ""
}
