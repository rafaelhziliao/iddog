import UIKit

protocol MainDisplayLogic: class {}

final class MainViewController: UIViewController {
    var interactor: MainBusinessLogic?
    var router: RoutingLogic?

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

    convenience init(
        interactor: MainBusinessLogic?,
        router: RoutingLogic
    ) {
        self.init(nibName: nil, bundle: nil)
        self.interactor = interactor
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
    }
}

extension MainViewController: MainDisplayLogic {}
