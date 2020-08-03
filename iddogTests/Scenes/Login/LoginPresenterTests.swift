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
        func displayCategories(with user: UserProtocol) {

        }

        func displaySignUpError(_ error: NetworkError) {

        }
    }

    // MARK: Tests

    func testPresentSomething() {
        // Given
        let spy = LoginDisplayLogicSpy()
        sut.viewController = spy


        // When
        

        // Then
        //    XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
