import UIKit

protocol LoginBusinessLogic {}

protocol LoginDataStore {}

final class LoginInteractor: LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginExternalServices?
}

extension LoginInteractor: LoginBusinessLogic {}
