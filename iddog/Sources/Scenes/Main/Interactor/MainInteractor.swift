import UIKit

protocol MainDataStore {
    var token: String { get set }
}

final class MainInteractor: MainDataStore {
    var presenter: MainPresentationLogic?
    var worker: MainExternalCalls?
    var token: String = ""
}
