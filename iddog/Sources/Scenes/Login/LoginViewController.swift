import UIKit

protocol LoginDisplayLogic: class {}

final class LoginViewController: UIViewController {
    var interactor: LoginBusinessLogic?
    var router: LoginRouterType?

    // MARK: Object lifecycle

    override init(
        nibName nibNameOrNil: String?,
        bundle nibBundleOrNil: Bundle?
    ) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        buildView()
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

extension LoginViewController: ViewCodable {
    func buildViewHierarchy() {}

    func setupConstraints() {}

    func additionalSetup() {
        view.backgroundColor = .green
    }
}

extension LoginViewController: LoginDisplayLogic {}
