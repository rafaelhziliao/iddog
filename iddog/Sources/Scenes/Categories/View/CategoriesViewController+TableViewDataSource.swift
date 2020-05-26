import UIKit

extension CategoriesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell()
        let category = categories[indexPath.row]
        cell.selectionStyle = .none
        cell.textLabel?.text = category.name
        cell.accessoryType = category.hasPhoto ? .disclosureIndicator : .none
        return cell
    }

}
