import Foundation

public final class URLSessionProvider: NetworkProviderProtocol, RequestHandleResponsable {
    private let session: URLSession

    public init() {
        session = URLSession(configuration: URLSession.shared.configuration)
    }

    public func performRequest<T: Decodable>(
        endpoint: EndpointProtocol,
        result: @escaping ResultHandler<T>
    ) {
        guard let request = URLRequest(endpoint: endpoint) else { preconditionFailure("Fail on create request") }

        let task = session.dataTask(with: request) { data, response, error in
            let response = response as? HTTPURLResponse
            self.handleResponse(data: data, response: response, error: error, result: result)
        }
        task.resume()
    }
}
