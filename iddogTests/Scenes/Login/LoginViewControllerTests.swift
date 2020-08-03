@testable import iddog
import XCTest

class LoginViewControllerTests: XCTestCase {
    // MARK: Subject under test

    var sut: LoginViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupLoginViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupLoginViewController() {
        sut = LoginViewController()
    }

    // MARK: Test doubles

    class LoginBusinessLogicSpy: LoginBusinessLogic {
        var signUpCalled = false

        func signUp(with email: String?) {
            signUpCalled = true
        }
    }

    class LoginRoutingLogicSpy: LoginRouterType {
        var routeToAlertCalled = false
        var dismissCalled = false
        var routeToCategoriesCalled = false

        var dataStore: LoginDataStore?

        func routeToAlert(_ alert: UIAlertController) {
            routeToAlertCalled = true
        }

        func dismiss() {
            dismissCalled = true
        }

        func routeToCategories() {
            routeToCategoriesCalled = true
        }
    }

    // MARK: Tests

    func testSignUp() {
        // Given
        let loginBusinessLogicSpy = LoginBusinessLogicSpy()
        sut.interactor = loginBusinessLogicSpy

        // When
        sut.didTapSignUpButton(sender: self)

        // Then
        XCTAssertTrue(
            loginBusinessLogicSpy.signUpCalled,
            " should ask the interactor to do sign up"
        )
    }

    func testDisplayCategories() {
        // Given
        let user = UserModel(
            email: "rafaelteste2@email.com",
            id: "5ed151d19609601c50f3296c",
            token: "token",
            createdAt: "teste",
            updatedAt: "teste",
            version: 0
        )

        let loginRoutingLogicSpy = LoginRoutingLogicSpy()
        sut.router = loginRoutingLogicSpy

        // When
        sut.displayCategories(with: user)

        // Then
        XCTAssertTrue(
            loginRoutingLogicSpy.routeToCategoriesCalled,
            "Diplay successfully categories scene"
        )
    }

    func testDisplaySignUpError() {
        // Given
        let loginRoutingLogicSpy = LoginRoutingLogicSpy()
        sut.router = loginRoutingLogicSpy

        // When
        sut.displaySignUpError(.unauthorized)

        // Then
        XCTAssertTrue(
            loginRoutingLogicSpy.routeToAlertCalled,
            "Diplay successfully error alert"
        )
    }

}
