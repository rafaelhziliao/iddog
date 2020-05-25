import UIKit

protocol LoginDataStore {}

final class LoginInteractor: LoginDataStore {
    var presenter: LoginPresentationLogic?
    var worker: LoginExternalCalls?
}
