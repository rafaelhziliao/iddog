@testable import iddog
import XCTest

class MainViewControllerTests: XCTestCase {
    // MARK: Subject under test

    var sut: MainViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupMainViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainViewController() {
        sut = MainViewController()
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles

    class MainBusinessLogicSpy: MainBusinessLogic {
        var requestCredentialsCalled = false

        func requestCredentials() {
            requestCredentialsCalled = true
        }
    }

    class MainRoutingLogicSpy: MainRouterType {
        var dataStore: MainDataStore?
        var routeToCategoriesCalled = false
        var routeToLoginCalled = false

        func routeToCategories() {
            routeToCategoriesCalled = true
        }

        func routeToLogin() {
            routeToLoginCalled = true
        }
    }

    // MARK: Tests

    func testRequestCredentialsWhenViewIsLoaded() {
        // Given
        let mainBusinessLogicSpy = MainBusinessLogicSpy()
        sut.interactor = mainBusinessLogicSpy

        // When
        loadView()

        // Then
        XCTAssertTrue(
            mainBusinessLogicSpy.requestCredentialsCalled,
            "viewDidLoad() should ask the interactor to request crendentials"
        )
    }

    func testDisplayLoginScene() {
        // Given
        let mainRouterSpy = MainRoutingLogicSpy()
        sut.router = mainRouterSpy

        // When
        sut.displayLogin()

        // Then
        XCTAssert(mainRouterSpy.routeToLoginCalled, "Displaying a successfully login scene")
    }

    func testDisplayCategoriesScene() {
        // Given
        let mainRouterSpy = MainRoutingLogicSpy()
        sut.router = mainRouterSpy

        // When
        sut.displayCategories()

        // Then
        XCTAssert(mainRouterSpy.routeToCategoriesCalled, "Displaying a successfully categories scene")

    }
}
