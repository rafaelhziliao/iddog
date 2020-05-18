import UIKit

protocol MainBusinessLogic {}

protocol MainDataStore {}

final class MainInteractor {
    let presenter: MainPresentationLogic
    let worker: ExternalServices

    init(
        presenter: MainPresentationLogic,
        worker: ExternalServices
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension MainInteractor: MainBusinessLogic {}

extension MainInteractor: MainDataStore {}
