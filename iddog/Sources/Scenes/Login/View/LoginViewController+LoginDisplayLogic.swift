import UIKit

protocol LoginDisplayLogic: class {
    func displayCategories(with user: UserProtocol)
    func displaySignUpError(_ error: NetworkError)
}

extension LoginViewController: LoginDisplayLogic {
    func displayCategories(with user: UserProtocol) {
        DispatchQueue.main.async {
            self.router?.routeToCategories()
        }
    }

    func displaySignUpError(_ error: NetworkError) {
        DispatchQueue.main.async {
            let retryAction: ((UIAlertAction) -> Void) = { action in
                self.interactor?.signUp(with: self.emailTextField.text)
            }

            let cancelAction: ((UIAlertAction) -> Void) = { action in
                self.router?.dismiss()
            }

            let alert = self.alertWithRetry(
                retryAction,
                cancelAction,
                for: error
            )
            self.router?.routeToAlert(alert)
        }
    }
}
