import Foundation

protocol MainBusinessLogic {
    func requestCredentials()
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
