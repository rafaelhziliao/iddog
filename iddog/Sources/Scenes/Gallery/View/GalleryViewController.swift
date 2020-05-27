import UIKit

final class GalleryViewController: UIViewController {
    var interactor: GalleryBusinessLogic?
    var router: GalleryRouterType?

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

extension GalleryViewController: ViewCodable {
    func buildViewHierarchy() {}

    func setupConstraints() {}

    func additionalSetup() {
        view.backgroundColor = .green
    }
}
