import Foundation

protocol MainRoutingLogic {
    func routeToCategories()
    func routeToLogin()
}

extension MainRouter: MainRoutingLogic {
    func routeToCategories() {
        let categoriesScene = CategoriesSceneFactory(window: window)
        categoriesScene.make()
    }

    func routeToLogin() {
        let loginScene = LoginSceneFactory(window: window)
        loginScene.make()
    }
}
