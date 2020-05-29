import UIKit

public extension UICollectionView {
    func dequeueReusableCell<T: UICollectionViewCell & Identifiable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError(
                """
                Cell is not registered - call
                collectionView.register(Cell.Type) to register first before using.
                """
            )
        }

        return cell
    }

    func register<T: UICollectionViewCell & Identifiable>(_: T.Type = T.self) {
        register(T.self, forCellWithReuseIdentifier: T.identifier)
    }
}
