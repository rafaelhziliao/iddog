import Foundation

struct GalleryEndpoint: EndpointDescriptor {
    var path: String {
        return "/feed"
    }

    var method: HttpMethod {
        return .get
    }

    var header: Header? {
        return [
            "Authorization": token
        ]
    }

    var parameters: Parameters? {
        return [
            "category": category
        ]
    }

    var body: Body? {
        return  nil
    }

    let category: String
    let token: String
}
