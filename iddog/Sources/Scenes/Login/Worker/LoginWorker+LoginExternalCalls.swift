import Foundation

protocol LoginExternalCalls {
    func signUp(with email: String?, result: @escaping ResultHandler<CredentialsProtocol>)
    func storeAccessToken(_ token: String)
}

extension LoginWorker: LoginExternalCalls {
    func storeAccessToken(_ token: String) {
        credentialStorage.setAccessTokenAsync(token)
    }

    func signUp(with email: String?, result:  @escaping ResultHandler<CredentialsProtocol>) {
        guard let email = email else {
            result(.failure(.unauthorized))
            return
        }

        let signUpEndpoint = SignupEndpoint(email: email)

        network.performRequest(endpoint: signUpEndpoint) { (value: Result<CredentialsModel, NetworkError>) in
            switch value {
            case let .success(credentials):
                result(.success(credentials))
            case  let .failure(error):
                result(.failure(error))
            }
        }
    }
}
