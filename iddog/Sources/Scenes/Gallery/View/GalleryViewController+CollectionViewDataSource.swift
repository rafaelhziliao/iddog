import UIKit

extension GalleryViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return galleryData?.list.count ?? .zero
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: GalleryCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.fill(with: galleryData!.list[indexPath.row])
        return cell
    }
}
