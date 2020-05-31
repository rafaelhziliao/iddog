import Foundation

public protocol TreatJSONDecode {
    func treatJSONDecode<T: Decodable>(data: Data, result: ResultHandler<T>)
}

public extension TreatJSONDecode {
    func treatJSONDecode<T: Decodable>(data: Data, result: ResultHandler<T>) {
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
}
