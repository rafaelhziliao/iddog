import Foundation

protocol CategoriesExternalCalls {
    func clearCredentials()
}

extension CategoriesWorker: CategoriesExternalCalls {
    func clearCredentials() {
        credentialStorage.clear()
    }
}
