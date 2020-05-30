import UIKit

protocol LoginDisplayLogic: class {
    func displayCategories(with user: UserProtocol)
    func displaySignUpError(_ error: NetworkError)
}

extension LoginViewController: LoginDisplayLogic, Alertable, FullScreenLoader {
    func displayCategories(with user: UserProtocol) {
        showLoading(false)
        router?.routeToCategories()
    }

    func displaySignUpError(_ error: NetworkError) {
        showLoading(false)

        let retryAction: ((UIAlertAction) -> Void) = { [weak self] action in
            self?.interactor?.signUp(with: self?.emailTextField.text)
        }

        let cancelAction: ((UIAlertAction) -> Void) = { [weak self] action in
            self?.router?.dismiss()
        }

        let alert = self.alertWithRetry(
            retryAction,
            cancelAction,
            for: error
        )
        router?.routeToAlert(alert)
    }
}
