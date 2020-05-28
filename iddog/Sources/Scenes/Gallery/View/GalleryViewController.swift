import UIKit

final class GalleryViewController: UIViewController {
    var interactor: GalleryBusinessLogic?
    var router: GalleryRouterType?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
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

        let url = URL(string: "https://images.dog.ceo/breeds/hound-english/n02089973_1.jpg")!
        interactor?.downloadImage(from: url)
    }
}

extension GalleryViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.safeAreaTop(safeAreaView: view)
        imageView.rightConstraint(parentView: view)
        imageView.leftConstraint(parentView: view)
        imageView.bottomConstraint(parentView: view)
    }

    func additionalSetup() {
        view.backgroundColor = .green
    }
}
