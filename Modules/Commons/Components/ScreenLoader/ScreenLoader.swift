import UIKit

class Loader: ScreenLoader {

    static var indicatorView: UIActivityIndicatorView?

    static func show() {
        if let window = UIApplication.shared.keyWindow {
            let frame = UIScreen.main.bounds
            indicatorView = UIActivityIndicatorView(frame: frame)
            indicatorView!.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
            indicatorView?.style = .whiteLarge
            window.addSubview(indicatorView!)
            indicatorView!.startAnimating()
        }
    }

    static func stop() {
        if indicatorView != nil {
            indicatorView!.stopAnimating()
            indicatorView!.removeFromSuperview()
            indicatorView = nil
        }
    }
}
