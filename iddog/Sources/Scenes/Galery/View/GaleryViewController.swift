import UIKit

final class GaleryViewController: UIViewController {
    var interactor: GaleryBusinessLogic?
    var router: GaleryRouterType?

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

extension GaleryViewController: ViewCodable {
    func buildViewHierarchy() {}

    func setupConstraints() {}

    func additionalSetup() {
        view.backgroundColor = .green
    }
}
