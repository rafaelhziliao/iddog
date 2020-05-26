import UIKit

final class CategoriesViewController: UIViewController {
    var interactor: CategoriesBusinessLogic?
    var router: CategoriesRouterType?

    private lazy var logoutBarButtonItem: UIBarButtonItem = {
        let button = UIBarButtonItem(
            image: R.image.ic_sair()?.withRenderingMode(.alwaysOriginal),
            style: .plain,
            target: self,
            action: #selector(didTapLogoutButton)
        )
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.rightBarButtonItem = logoutBarButtonItem
        title = "TESTE TITLE"
    }
}

private extension CategoriesViewController {
    @objc func didTapLogoutButton() {
        interactor?.logout()
    }
}

extension CategoriesViewController: ViewCodable {
    func buildViewHierarchy() {
    }

    func setupConstraints() {
    }

    func additionalSetup() {
    }

}
