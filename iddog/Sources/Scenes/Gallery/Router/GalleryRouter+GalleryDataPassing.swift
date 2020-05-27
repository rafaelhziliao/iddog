import Foundation

protocol GalleryDataPassing {
    var dataStore: GalleryDataStore? { get }
}

extension GalleryRouter: GalleryDataPassing {}
