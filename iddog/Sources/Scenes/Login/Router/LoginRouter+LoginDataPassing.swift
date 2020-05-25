import Foundation

protocol LoginDataPassing {
    var dataStore: LoginDataStore? { get }
}

extension LoginRouter: LoginDataPassing {}
