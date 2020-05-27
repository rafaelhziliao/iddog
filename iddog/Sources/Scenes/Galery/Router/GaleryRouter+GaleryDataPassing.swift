import Foundation

protocol GaleryDataPassing {
    var dataStore: GaleryDataStore? { get }
}

extension GaleryRouter: GaleryDataPassing {}
