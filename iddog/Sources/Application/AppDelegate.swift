import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    lazy var window: UIWindow? = {
       return UIWindow()
    }()

    lazy var mainScene: MainSceneFactory = {
        guard let window = self.window else { fatalError("Failed to create window") }

        let mainScene = MainSceneFactory(window: window)
        return mainScene
    }()

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        mainScene.make()
        window?.makeKeyAndVisible()

        AppearanceCustomization(
            navBarTitleTextAttributes: R.color.appWhite(),
            navBarLargeTitleTextAttributes: R.color.appWhite(),
            navBarBackgroudColor: R.color.appPurple(),
            navBarTintColor: R.color.appWhite(),
            alertControllerTintColor: R.color.appPurple()
        ).apply()

        return true
    }
}
