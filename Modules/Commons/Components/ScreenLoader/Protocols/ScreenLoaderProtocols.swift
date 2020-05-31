import UIKit

protocol ScreenLoader {
    static var indicatorView: UIActivityIndicatorView? {get set}
    static func show()
    static func stop()
}

protocol FullScreenLoader {
    func showLoading(_ show: Bool)
}

extension FullScreenLoader {
    func showLoading(_ show: Bool) {
        DispatchQueue.main.async {
            if show {
                Loader.show()
            } else {
                Loader.stop()
            }
        }
    }
}
