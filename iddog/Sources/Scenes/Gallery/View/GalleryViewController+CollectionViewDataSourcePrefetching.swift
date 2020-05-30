import UIKit

extension GalleryViewController: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
        guard let galleryData = galleryData else { return }
        let urls = indexPaths.map { galleryData.list[$0.row] }
        interactor?.starPrefetchDataSourceOperation(with: urls)
    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {
        guard let galleryData = galleryData else { return }
        let urls = indexPaths.map { galleryData.list[$0.row] }
        interactor?.cancelPrefethcDataSoucerOperation(with: urls)
    }
}
