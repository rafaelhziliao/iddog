@testable import iddog
import XCTest

class LoginPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: LoginPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupLoginPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupLoginPresenter() {
        sut = LoginPresenter()
    }

    // MARK: Test doubles

    class LoginDisplayLogicSpy: LoginDisplayLogic {
        var displayCategoriesCalled = false
        var displaySignUpErrorCalled = false

        func displayCategories(with user: UserProtocol) {
            displayCategoriesCalled = true
        }

        func displaySignUpError(_ error: NetworkError) {
            displaySignUpErrorCalled = true
        }
    }

    // MARK: Tests

    func testPresentCategories() {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy

        let user = UserModel(
            email: "teste",
            id: "1",
            token: "token",
            createdAt: "createdAt",
            updatedAt: "createdAt",
            version: 1
        )

        // When
        sut.presentCategories(user: user)

        // Then
        XCTAssertTrue(
            spy.displayCategoriesCalled,
            "presentSomething(response:) should ask the view controller to display the result"
        )
    }

    func testPresentSignUpError() {
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy

        // When
        sut.presentSignUpError(.unauthorized)

        // Then
        XCTAssertTrue(
            spy.displaySignUpErrorCalled,
            "presentSomething(response:) should ask the view controller to display the result"
        )
    }
}
