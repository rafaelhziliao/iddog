import UIKit

final class GalleryViewController: UIViewController {
    var interactor: GalleryBusinessLogic?
    var router: GalleryRouterType?

    lazy var flowLayout: UICollectionViewFlowLayout = {
        let itemsPerRow = 4
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 2.0
        flowLayout.minimumInteritemSpacing = 2.0
        let side = (Double(view.bounds.size.width) - Double(itemsPerRow - 1) * 2.0) / Double(itemsPerRow)
        flowLayout.itemSize = CGSize(width: side, height: side)
        return flowLayout
    }()

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.collectionViewLayout = flowLayout
        collection.backgroundColor = R.color.appLightGray()
        collection.delegate = self
        collection.dataSource = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(GalleryCollectionViewCell.self)
        return collection
    }()

    var galleryData: CategoryGalleryProtocol? {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
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
        getLinkList()
    }

    private func getLinkList() {
        interactor?.getLinkList()
    }
}

extension GalleryViewController: ViewCodable {
    func buildViewHierarchy() {
        view.addSubview(collectionView)
    }

    func setupConstraints() {
        collectionView.safeAreaTop(safeAreaView: view)
        collectionView.rightConstraint(parentView: view)
        collectionView.leftConstraint(parentView: view)
        collectionView.bottomConstraint(parentView: view)
    }

    func additionalSetup() {
        view.backgroundColor = R.color.appLightGray()
    }
}
