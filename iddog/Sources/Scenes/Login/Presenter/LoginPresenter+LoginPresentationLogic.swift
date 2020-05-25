import Foundation

protocol LoginPresentationLogic {
    func presentCategories(user: UserProtocol)
    func presentSignUpError(_ error: NetworkError)
}

extension LoginPresenter: LoginPresentationLogic {
    func presentCategories(user: UserProtocol) {
        viewController?.displayCategories(with: user)
    }

    func presentSignUpError(_ error: NetworkError) {
        viewController?.displaySignUpError(error)
    }
}
