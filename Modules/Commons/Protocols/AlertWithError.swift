import UIKit

protocol AlertWithError {
    func alertWithError(_ error: NetworkError) -> UIAlertController

    func alertWithError(
        title: String,
        message: String,
        actions: [String]?,
        handlers: [((UIAlertAction) -> Void)?]?
    ) -> UIAlertController

    func alertWithRetry(
        _ retry: ((UIAlertAction) -> Void)?,
        _ cancel: ((UIAlertAction) -> Void)?,
        for error: NetworkError
    ) -> UIAlertController
}

extension AlertWithError {

    func alertWithError(_ error: NetworkError) -> UIAlertController {
        let title = R.string.localizable.errorAlertDefaultTitle()
        let message = error.messageToPresentToUser()
        let actionButton = R.string.localizable.errorAlertDefaultAction()

        return alertWithError(title: title, message: message, actions: [actionButton])
    }

    //swiftlint:disable:next function_body_length
    func alertWithError(
        title: String,
        message: String,
        actions: [String]?,
        handlers: [((UIAlertAction) -> Void)?]? = nil
    ) -> UIAlertController {

        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        if actions == nil || actions?.isEmpty == true {
            let dismiss = UIAlertAction(
                title: R.string.localizable.errorAlertDefaultAction(),
                style: .default,
                handler: nil
            )
            alert.addAction(dismiss)
            return alert
        }

        if handlers == nil {
            actions?.forEach {
                let action = UIAlertAction(
                    title: $0,
                    style: .default,
                    handler: nil
                )
                alert.addAction(action)
            }
            return alert
        }

        guard
            let actionsTitles = actions,
            let actionsHandlers = handlers
        else {
            return alert
        }

        for (actionTitle, handler) in zip(actionsTitles, actionsHandlers) {
            let action = UIAlertAction(
                title: actionTitle,
                style: .default,
                handler: handler
            )
            alert.addAction(action)
        }
        return alert
    }

    func alertWithRetry(
        _ retry: ((UIAlertAction) -> Void)?,
        _ cancel: ((UIAlertAction) -> Void)? = nil,
        for error: NetworkError
    ) -> UIAlertController {
        let actions = [
            R.string.localizable.tryAgain(),
            R.string.localizable.cancel()
        ]
        let alert = alertWithError(
            title: R.string.localizable.somethingWrong(),
            message: error.messageToPresentToUser(),
            actions: actions,
            handlers: [
                retry,
                cancel
            ]
        )
        return alert
    }
}
