import UIKit

protocol MainPresentationLogic {}

final class MainPresenter {
    weak var viewController: MainDisplayLogic?
}

extension MainPresenter: MainPresentationLogic {}
