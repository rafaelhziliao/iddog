import Foundation

struct GalleryEndpoint: EndpointProtocol {
    var path: String {
        return "/feed"
    }

    var method: HttpMethod {
        return .get
    }
    //swiftlint:disable line_length
    let token = """
    eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWViYWZiYjdlYmU3MTY0MzA0ZTFiOTU1IiwiaWF0IjoxNTg5MzEyNDM5LCJleHAiOjE1OTA2MDg0Mzl9.iFm8HI9wZZIt5Y_ET1PIG39sGyCfZp4lT2pv2BhEhzk
    """

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
}
