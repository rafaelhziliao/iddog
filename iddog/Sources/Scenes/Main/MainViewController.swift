import UIKit

protocol MainDisplayLogic: class {
    func displayCategories()
    func displayLogin()
}

final class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: MainRouterType?

    private lazy var appNameLabel: UILabel = {
        let label = UILabel()
        label.text = MainSceneConstants.appName
        label.textColor = .white
        label.font = FontHelper.font(
            for: HelveticaNeue.boldItalic,
            and: MainSceneConstants.appNameFontSize
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.text = MainSceneConstants.authorName
        label.textColor = .white
        label.font = FontHelper.font(
            for: HelveticaNeue.light,
            and: MainSceneConstants.authorNameFontSize
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        interactor?.requestCredentials()
    }
}

extension MainViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(appNameLabel)
        view.addSubview(authorLabel)
    }

    func setupConstraints() {
        appNameLabel.centerXConstraint(parentView: view)
        appNameLabel.centerYConstraint(parentView: view)

        authorLabel.centerXConstraint(parentView: view)
        authorLabel.safeAreaBottom(safeAreaView: view)
    }

    func additionalSetup() {
        view.backgroundColor = .systemPurple
    }

}

extension MainViewController: MainDisplayLogic {
    func displayCategories() {
        router?.routeToCategories()
    }

    func displayLogin() {
        router?.routeToLogin()
    }

}
