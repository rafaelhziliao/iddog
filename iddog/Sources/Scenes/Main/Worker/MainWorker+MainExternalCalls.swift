import Foundation

protocol MainExternalCalls {
    func requestCrendentials(result: (String?) -> Void)
}

extension MainWorker: MainExternalCalls {
    func requestCrendentials(result: (String?) -> Void) {
        guard let token = credentialStorage.getAccessTokenSync() else {
            return result(nil)
        }
        result(token)
    }
}
