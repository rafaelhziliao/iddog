import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let network: NetworkProviderProtocol = URLSessionProvider()
        let securityStorage = CredentialStorage.shared
        let signupEndpoint = SignupEndpoint(email: "rafael@email.com")

        let result: ResultHandler<CredentialsModel> = { response in
            switch response {
            case let .success(credentials):
                print(credentials.user)
                securityStorage.setAccessTokenAsync(credentials.user.token)
                print(securityStorage.getAccessTokenSync())
                securityStorage.clear()
                print(securityStorage.getAccessTokenSync())
            case let .failure(error):
                print(error)
            }
        }

        network.performRequest(endpoint: signupEndpoint, result: result)

//        let categoryImagesEndpoint = CategoryImagesEndpoint(category: "hound")
//
//        let result: ResultHandler<CategoryModel> = { response in
//            switch response {
//            case let .success(user):
//                print(user)
//            case let .failure(error):
//                print(error)
//            }
//        }
//
//        network.performRequest(endpoint: categoryImagesEndpoint, result: result)

    }
}
