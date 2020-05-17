import Foundation

public typealias Header = [String: String]
public typealias Parameters = [String: Any]
public typealias Body = [String: Any]

public protocol EndpointProtocol {
    var scheme: String { get }
    var host: String { get }
    var path: String { get }
    var method: HttpMethod { get }
    var header: Header? { get }
    var parameters: Parameters? { get }
    var body: Body? { get }
}
