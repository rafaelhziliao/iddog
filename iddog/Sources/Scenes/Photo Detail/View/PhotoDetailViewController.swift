import UIKit

protocol PhotoDetailDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayImageError(_ errorImage: UIImage?)
}

final class PhotoDetailViewController: UIViewController {
    var interactor: PhotoDetailBusinessLogic?
    var router: PhotoDetailRouterType?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: Object lifecycle

    override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        downloadImage()
    }

    private func downloadImage() {
        showLoading(true)
        interactor?.downloadImage()
    }
}

extension PhotoDetailViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.centerXConstraint(parentView: view)
        imageView.centerYConstraint(parentView: view)
        imageView.widthConstraintEqualTo(parentView: view)
        imageView.heightConstraintEqualTo(parentView: view)
    }

    func additionalSetup() {}
}

extension PhotoDetailViewController: PhotoDetailDisplayLogic, FullScreenLoader {
    func displayDownloadedImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.showLoading(false)
            self.imageView.image = image
        }
    }

    func displayImageError(_ errorImage: UIImage?) {
        DispatchQueue.main.async {
            self.showLoading(false)
            self.imageView.image = errorImage
        }
    }

}
