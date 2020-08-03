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

    var localizedDescription: String {
        switch self {
        case let .custom(description):
            return description
        case .unknown, .parseError, .noJSONData, .badRequest, .outDated:
            return R.string.localizable.notPossibleConnect()
        case .requestTimeout, .noNetwork:
            return R.string.localizable.requestTimeOut()
        case .unauthorized:
            return R.string.localizable.invalidInput()
        }
    }

    public init(description: String) {
        self = .custom(description: description)
    }
}
