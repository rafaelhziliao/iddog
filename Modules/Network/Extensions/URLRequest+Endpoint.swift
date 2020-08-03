import Foundation

extension URLRequest {
    init?(endpoint: EndpointDescriptor) {
        guard
            let urlComponents = URLComponents(endpoint: endpoint),
            let url = urlComponents.url
        else {
            return nil
        }

        self.init(url: url)

        httpMethod = endpoint.method.rawValue

        addValue("application/json", forHTTPHeaderField: "Content-Type")

        endpoint.header?.forEach {
            addValue($0.value, forHTTPHeaderField: $0.key)
        }

        guard let body = endpoint.body else {
            return
        }

        httpBody = try? JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
    }
}
