import UIKit

public typealias ResulImageHandler = (Result<UIImage, Error>) -> Void

public protocol ImageLoaderServiceProtocol {
    func loadImage(with url: URL, result: @escaping ResulImageHandler)
}
