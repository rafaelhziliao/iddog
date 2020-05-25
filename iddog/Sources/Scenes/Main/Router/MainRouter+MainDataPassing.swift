import Foundation

protocol MainDataPassing {
    var dataStore: MainDataStore? { get }
}

extension MainRouter: MainDataPassing {}
