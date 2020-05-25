import Foundation

protocol CategoriesRoutingLogic {
    func routeToLogin()
}

extension CategoriesRouter: CategoriesRoutingLogic {
    func routeToLogin() {
        let loginScene = LoginSceneFactory(window: window)
        loginScene.make()
    }
}
