import Foundation

protocol MainRoutingLogic {
    func routeToCategories()
    func routeToLogin()
}

extension MainRouter: MainRoutingLogic {
    func routeToCategories() {}

    func routeToLogin() {
        let loginScene = LoginSceneFactory(window: window)
        loginScene.make()
    }
}
