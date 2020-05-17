import Foundation

struct SignupEndpoint: EndpointProtocol {

    var path: String {
        return "/signup"
    }

    var method: HttpMethod {
        return .post
    }

    var header: Header? {
        return nil
    }

    var parameters: Parameters? {
        return nil
    }

    var body: Body? {
        return ["email": email]
    }

    let email: String
}
