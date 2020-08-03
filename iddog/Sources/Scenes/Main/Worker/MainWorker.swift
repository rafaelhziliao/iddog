import UIKit

final class MainWorker {
    let credentialStorage: SecurityStorageProtocol

    init(
        credentialStorage: SecurityStorageProtocol
    ) {
        self.credentialStorage = credentialStorage
    }
}
