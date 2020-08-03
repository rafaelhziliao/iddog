import Foundation

protocol LoginBusinessLogic {
    func signUp(with email: String?)
}

extension LoginInteractor: LoginBusinessLogic {
    func signUp(with email: String?) {
        worker?.signUp(with: email) { [weak self]response in
            switch response {
            case let .success(credentials):
                self?.worker?.storeAccessToken(credentials.user.token)
                self?.presenter?.presentCategories(user: credentials.user)
            case let .failure(error):
                self?.presenter?.presentSignUpError(error)
            }
        }
    }
}
