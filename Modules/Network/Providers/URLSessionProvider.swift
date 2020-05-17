import Foundation

public final class URLSessionProvider: NetworkProviderProtocol {
    private let session: URLSession

    public init() {
        session = URLSession(configuration: URLSession.shared.configuration)
    }

    public func performRequest<T: Decodable>(endpoint: EndpointProtocol, result: @escaping ResultHandler<T>) {
        guard let request = URLRequest(endpoint: endpoint) else { preconditionFailure("Fail on create request") }

        session.dataTask(with: request) { data, response, error in
            let response = response as? HTTPURLResponse
            self.handleResponse(data: data, response: response, error: error, result: result)
        }.resume()
    }

    private func handleResponse<T: Decodable>(
        data: Data?, response: HTTPURLResponse?,
        error: Error?,
        result: ResultHandler<T>
    ) {

        if let error = error {
            return result(.failure(NetworkError(description: error.localizedDescription)))
        }

        guard
            let response = response,
            let data = data
        else {
            return result(.failure(.noJSONData))
        }

        treatDataResponse(data: data, response: response, result: result)
    }

    private func treatJSONDecode<T: Decodable>(data: Data, result: ResultHandler<T>) {
        do {
            let decoder: JSONDecoder = .init()
            let decodable = try decoder.decode(T.self, from: data)
            result(.success(decodable))
        } catch DecodingError.keyNotFound(let key, let context) {
            result(.failure(
                NetworkError(description:
                    "Failed to decode missing key '\(key.stringValue)' not found – \(context.debugDescription)")
                )
            )
        } catch DecodingError.typeMismatch(_, let context) {
            result(.failure(
                NetworkError(description: "Failed to decode to type mismatch – \(context.debugDescription)")
                )
            )
        } catch DecodingError.valueNotFound(let type, let context) {
            result(.failure(
                NetworkError(
                    description: "Failed to decode to missing \(type) value – \(context.debugDescription)")
                )
            )
        } catch DecodingError.dataCorrupted(_) {
            result(.failure(.noJSONData))
        } catch {
            result(.failure(.parseError))
        }
    }

    private func treatDataResponse<T: Decodable>(
        data: Data,
        response: HTTPURLResponse,
        result: ResultHandler<T>
    ) {
        switch response.statusCode {
        case 200...299:
            treatJSONDecode(data: data, result: result)
        case 400...499:
            result(.failure(.unauthorized))
        case 500...599:
            result(.failure(.badRequest))
        case 600:
            result(.failure(.outDated))
        default:
            result(.failure(.unknown))
        }
    }
}
