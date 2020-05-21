import UIKit

protocol LoginPresentationLogic {}

final class LoginPresenter {
    weak var viewController: LoginDisplayLogic?
}

extension LoginPresenter: LoginPresentationLogic {}
