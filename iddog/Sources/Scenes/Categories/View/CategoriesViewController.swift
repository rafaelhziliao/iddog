import UIKit

final class CategoriesViewController: UIViewController {
    var interactor: CategoriesBusinessLogic?
    var router: CategoriesRouterType?

    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle(
            "Logout",
            for: .normal
        )
        button.setTitleColor(
            R.color.appWhite(),
            for: .normal
        )
        button.addTarget(
            self,
            action: #selector(didTapLogoutButton),
            for: .touchUpInside
        )
        button.backgroundColor = R.color.appGreen()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        buildView()
    }

    convenience init() {
        self.init(nibName: nil, bundle: nil)
        buildView()
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

private extension CategoriesViewController {
    @objc func didTapLogoutButton() {
        interactor?.logout()
    }
}

extension CategoriesViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(logoutButton)
    }

    func setupConstraints() {
        logoutButton.centerXConstraint(parentView: view)
        logoutButton.centerYConstraint(parentView: view)
        logoutButton.widthConstraint(constant: 288)
    }

    func additionalSetup() {
        view.backgroundColor = R.color.appPurple()
    }

}
