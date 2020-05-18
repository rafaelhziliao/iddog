import UIKit

protocol MainBusinessLogic {
    func requestCredentials()
}

protocol MainDataStore {
    var token: String { get set }
}

final class MainInteractor: MainDataStore {
    let presenter: MainPresentationLogic
    let worker: ExternalServices
    var token: String = ""

    init(
        presenter: MainPresentationLogic,
        worker: ExternalServices
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MainInteractor: MainBusinessLogic {
    func requestCredentials() {
        worker.requestCrendentials { token in
            if let token = token {
                self.token = token
                presenter.presentCategories()
            } else {
                presenter.presentLogin()
            }
        }
    }
}
