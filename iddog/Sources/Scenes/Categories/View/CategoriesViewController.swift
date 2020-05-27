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

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = R.color.appLightGray()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var categories: CategoriesModel = [] {
        didSet {
            tableView.reloadData()
        }
    }

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
        fetchCategories()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationItem.rightBarButtonItem = logoutBarButtonItem
    }
}

extension CategoriesViewController {
    @objc func didTapLogoutButton() {
        displayLogoutConfirmation()
    }

    func fetchCategories() {
        interactor?.fetchCategories()
    }

    func sendCategoryNameToDataStore(_ name: String) {
        interactor?.setCategoryNameOnDataStore(name)
    }
}

extension CategoriesViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.safeAreaTop(safeAreaView: view)
        tableView.rightConstraint(parentView: view)
        tableView.leftConstraint(parentView: view)
        tableView.bottomConstraint(parentView: view)
    }

    func additionalSetup() {
        title = R.string.localizable.categoriesScreenTitle()
    }
}
