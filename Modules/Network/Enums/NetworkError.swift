import Foundation

public enum NetworkError: Error {
    case custom(description: String)
    case unknown
    case parseError
    case noJSONData
    case noNetwork
    case requestTimeout
    case unauthorized
    case badRequest
    case outDated

    public init(description: String) {
        self = .custom(description: description)
    }
}
