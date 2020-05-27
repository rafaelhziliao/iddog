import UIKit

extension CategoriesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = categories[indexPath.row]
        guard category.hasPhoto else {
            return
        }
        sendCategoryNameToDataStore(category.name)
    }
}
