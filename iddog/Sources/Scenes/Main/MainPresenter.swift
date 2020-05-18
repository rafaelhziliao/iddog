import UIKit

protocol MainPresentationLogic {
    func presentCategories()
    func presentLogin()
}

final class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {
    func presentCategories() {

    }

    func presentLogin() {}
}
