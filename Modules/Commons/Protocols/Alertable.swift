import UIKit

protocol Alertable {
    func alertWithError(_ error: NetworkError) -> UIAlertController

    func alertWithActions(
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

extension Alertable {

    private func alertWithoutActions(_ alert: inout UIAlertController) {
        let dismiss = UIAlertAction(
            title: R.string.localizable.errorAlertDefaultAction(),
            style: .default,
            handler: nil
        )
        alert.addAction(dismiss)
    }

    private func alertWithoutHandlers(actions: [String]?, _ alert: inout UIAlertController) {
        actions?.forEach {
            let action = UIAlertAction(
                title: $0,
                style: .default,
                handler: nil
            )
            alert.addAction(action)
        }
    }

    private func zipActionHandlersAndActionTitles(
        actionsTitles: [String],
        actionsHandlers: [((UIAlertAction) -> Void)?],
        _ alert: inout UIAlertController
    ) {
        for (actionTitle, handler) in zip(actionsTitles, actionsHandlers) {
            let action = UIAlertAction(
                title: actionTitle,
                style: .default,
                handler: handler
            )
            alert.addAction(action)
        }
    }

    //swiftlint:disable:next function_body_length
    func alertWithActions(
        title: String,
        message: String,
        actions: [String]?,
        handlers: [((UIAlertAction) -> Void)?]? = nil
    ) -> UIAlertController {

        var alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )

        if actions == nil || actions?.isEmpty == true {
            alertWithoutActions(&alert)
            return alert
        }

        if handlers == nil {
            alertWithoutHandlers(
                actions: actions,
                &alert
            )
            return alert
        }

        guard
            let actionsTitles = actions,
            let actionsHandlers = handlers
        else {
            return alert
        }

        zipActionHandlersAndActionTitles(
            actionsTitles: actionsTitles,
            actionsHandlers: actionsHandlers,
            &alert
        )

        return alert
    }

    func alertWithError(_ error: NetworkError) -> UIAlertController {
        let title = R.string.localizable.errorAlertDefaultTitle()
        let message = error.messageToPresentToUser()
        let actionButton = R.string.localizable.errorAlertDefaultAction()

        return alertWithActions(
            title: title,
            message: message,
            actions: [actionButton]
        )
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
        let alert = alertWithActions(
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
