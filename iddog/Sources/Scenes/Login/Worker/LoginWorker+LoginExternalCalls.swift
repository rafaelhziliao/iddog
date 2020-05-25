import Foundation

protocol LoginExternalCalls {
    func signUp(with email: String?, result: @escaping ResultHandler<CredentialsProtocol>)
}

extension LoginWorker: LoginExternalCalls {
    func signUp(with email: String?, result:  @escaping ResultHandler<CredentialsProtocol>) {
        guard let email = email else {
            result(.failure(.unauthorized))
            return
        }

        let signUpEndpoint = SignupEndpoint(email: email)

        let result: ResultHandler<CredentialsModel> = { [weak self] response in
            switch response {
            case let .success(credentials):
                self?.credentialStorage.setAccessTokenAsync(credentials.user.token)
                result(.success(credentials))
            case let .failure(error):
                result(.failure(error))
            }
        }

        network.performRequest(
            endpoint: signUpEndpoint,
            result: result
        )

    }
}
