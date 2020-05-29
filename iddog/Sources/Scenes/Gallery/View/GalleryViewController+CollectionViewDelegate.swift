import UIKit

extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard
            let url = galleryData?.list[indexPath.row]
        else {
            return
        }
        interactor?.storeImageURL(url)
    }
}
