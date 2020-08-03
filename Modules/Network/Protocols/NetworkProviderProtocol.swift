import Foundation

public typealias ResultHandler<T> = (Result<T, NetworkError>) -> Void

public protocol NetworkProviderProtocol {
    func performRequest<T: Decodable>(endpoint: EndpointDescriptor, result: @escaping ResultHandler<T>)
}
