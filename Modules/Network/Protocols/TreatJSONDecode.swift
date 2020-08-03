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
            let description = """
                Failed to decode missing key '\(key.stringValue)'
                not found – \(context.debugDescription)
            """
            result(.failure(NetworkError(description: description)))
        } catch DecodingError.typeMismatch(_, let context) {
            let description = "Failed to decode to type mismatch – \(context.debugDescription)"
            result(.failure(NetworkError(description: description)))
        } catch DecodingError.valueNotFound(let type, let context) {
            let descritpion = "Failed to decode to missing \(type) value – \(context.debugDescription)"
            result(.failure(NetworkError(description: descritpion)))
        } catch DecodingError.dataCorrupted(_) {
            result(.failure(.noJSONData))
        } catch {
            result(.failure(.parseError))
        }
    }
}
