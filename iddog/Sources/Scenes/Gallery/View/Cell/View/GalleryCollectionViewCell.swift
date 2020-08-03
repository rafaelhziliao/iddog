import UIKit

protocol GalleryCollectionViewCellDisplayLogic: class {
    func displayDownloadedImage(_ image: UIImage)
    func displayImageError(_ errorImage: UIImage?)
}

class GalleryCollectionViewCell: UICollectionViewCell, Identifiable {
    var interactor: GalleryCollectionViewCellBusinessLogic?

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCellArchitecture()
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        interactor?.cancelDownload()
    }

    private func setupCellArchitecture() {
        let view = self
        let interactor = GalleryCollectionViewCellInteractor()
        let presenter = GalleryCollectionViewCellPresenter()
        let worker = GalleryCollectionViewCellWorker(
            imageLoaderService: NukeImageLoaderProvider()
        )

        view.interactor = interactor
        interactor.worker = worker
        interactor.presenter = presenter
        presenter.view = view
    }
}

extension GalleryCollectionViewCell: ViewCoding {
    func buildViewHierarchy() {
        contentView.addSubview(imageView)
    }

    func setupConstraints() {
        imageView.centerXConstraint(parentView: contentView)
        imageView.centerYConstraint(parentView: contentView)
        imageView.widthConstraintEqualTo(parentView: contentView)
        imageView.heightConstraintEqualTo(parentView: contentView)
    }
}

extension GalleryCollectionViewCell: Fillable {
    func fill(with data: URL) {
        interactor?.downloadImage(from: data)
    }
}

extension GalleryCollectionViewCell: GalleryCollectionViewCellDisplayLogic {
    func displayDownloadedImage(_ image: UIImage) {
        imageView.image = image
    }

    func displayImageError(_ errorImage: UIImage?) {
        imageView.image = errorImage
    }
}
