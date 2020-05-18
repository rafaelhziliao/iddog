import Foundation

public protocol SecurityStorageProtocol {
    var service: SecurityServiceProtocol { get }
    func getAccessTokenSync() -> String?
    func setAccessTokenAsync(_ token: String?)
    func clear()
}
