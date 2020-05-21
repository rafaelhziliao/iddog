import UIKit

protocol MainBusinessLogic {
    func requestCredentials()
}

protocol MainDataStore {
    var token: String { get set }
}

final class MainInteractor: MainDataStore {
    var presenter: MainPresentationLogic?
    var worker: ExternalServices?
    var token: String = ""
}

extension MainInteractor: MainBusinessLogic {
    func requestCredentials() {
        worker?.requestCrendentials { [weak self] token in
            if let token = token {
                self?.token = token
                self?.presenter?.presentCategories()
            } else {
                self?.presenter?.presentLogin()
            }
        }
    }
}
