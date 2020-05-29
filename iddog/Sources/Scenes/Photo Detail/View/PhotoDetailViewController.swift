import UIKit

protocol PhotoDetailDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayImageError(_ errorImage: UIImage?)
}

final class PhotoDetailViewController: UIViewController {
    var interactor: PhotoDetailBusinessLogic?

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
    }
}

extension PhotoDetailViewController: ViewCodable {
    func buildViewHierarchy() {}

    func setupConstraints() {}

    func additionalSetup() {
        view.backgroundColor = R.color.appGreen()
    }
}

extension PhotoDetailViewController: PhotoDetailDisplayLogic {
    func displayDownloadedImage(_ image: UIImage) {

    }

    func displayImageError(_ errorImage: UIImage?) {

    }

}
