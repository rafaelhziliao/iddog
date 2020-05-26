import UIKit

public class AppearanceCustomization {
    let navBarTitleTextAttributes: UIColor?
    let navBarLargeTitleTextAttributes: UIColor?
    let navBarBackgroudColor: UIColor?
    let alertControllerTintColor: UIColor?

    public init(
        navBarTitleTextAttributes: UIColor? = nil,
        navBarLargeTitleTextAttributes: UIColor? = nil,
        navBarBackgroudColor: UIColor? = nil,
        alertControllerTintColor: UIColor? = nil
    ) {
        self.navBarTitleTextAttributes = navBarTitleTextAttributes
        self.navBarLargeTitleTextAttributes = navBarLargeTitleTextAttributes
        self.navBarBackgroudColor = navBarBackgroudColor
        self.alertControllerTintColor = alertControllerTintColor
    }

    public func apply() {
        setAlertControllerAppearance()
        setNavigationBarAppearance()
    }

    private func setNavigationBarAppearance() {
        if #available(iOS 13.0, *) {
            navigationBarIOS13()
        } else {
            navigationBarIOSLowerThan13()
        }
    }

    private func navigationBarIOSLowerThan13() {
        UINavigationBar.appearance().barTintColor = navBarBackgroudColor
        UINavigationBar.appearance().tintColor = navBarTitleTextAttributes
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: navBarTitleTextAttributes ?? .black
        ]
    }

    @available(iOS 13.0, *)
    private func navigationBarIOS13() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: navBarTitleTextAttributes ?? .black
        ]

        navBarAppearance.largeTitleTextAttributes = [
            .foregroundColor: navBarLargeTitleTextAttributes ?? .black
        ]

        navBarAppearance.backgroundColor = navBarBackgroudColor ?? .white

        UINavigationBar.appearance(
            whenContainedInInstancesOf: [UINavigationController.self]
        ).standardAppearance = navBarAppearance

        UINavigationBar.appearance(
            whenContainedInInstancesOf: [UINavigationController.self]
        ).scrollEdgeAppearance = navBarAppearance
    }

    private func setAlertControllerAppearance() {
        UIView.appearance(
            whenContainedInInstancesOf: [UIAlertController.self]
        ).tintColor = alertControllerTintColor ?? .clear
    }

}
