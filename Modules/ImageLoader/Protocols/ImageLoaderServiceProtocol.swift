import UIKit

public typealias ResulImageHandler = (Result<UIImage, Error>) -> Void

public protocol ImageLoaderServiceProtocol {
    func downloadImage(with url: URL, result: @escaping ResulImageHandler)
    func cancelDownload()
    func starPrefetchDataSourceOperation(with urls: [URL])
    func cancelPrefethcDataSoucerOperation(with urls: [URL])
}

public extension ImageLoaderServiceProtocol {
    func starPrefetchDataSourceOperation(with urls: [URL]) {

    }
    func cancelPrefethcDataSoucerOperation(with urls: [URL]) {

    }

}
