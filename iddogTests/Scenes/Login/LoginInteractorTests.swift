@testable import iddog
import XCTest

class LoginInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: LoginInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupLoginInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupLoginInteractor() {
        sut = LoginInteractor()
    }

    // MARK: Test doubles

    class LoginPresentationLogicSpy: LoginPresentationLogic {
        var presentCategoriesCalled = false
        var presentSignUpErrorCalled = false

        func presentCategories(user: UserProtocol) {
            presentCategoriesCalled = true
        }

        func presentSignUpError(_ error: NetworkError) {
            presentSignUpErrorCalled = true
        }

    }

    class LoginExternalCallsSpy: LoginExternalCalls {
        var storeAccessTokenCalled = false
        var signUpCalled = false

        func signUp(with email: String?, result: @escaping ResultHandler<CredentialsProtocol>) {
            signUpCalled = true
        }

        func storeAccessToken(_ token: String) {
            storeAccessTokenCalled = true
        }
    }

    // MARK: Tests

    func testAskLoginWorkerToSignUpAndPresentCategories() {
        // Given
        let email = "rafaelteste2@email.com"

        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy

        let loginExternalCallsSpy = LoginExternalCallsSpy()
        sut.worker = loginExternalCallsSpy

        // When
        sut.signUp(with: email)

        // Then
        XCTAssertTrue(
            loginExternalCallsSpy.signUpCalled,
            "signUp(with:) should ask LoginWorker to sign up"
        )

        XCTAssertTrue(
            loginExternalCallsSpy.storeAccessTokenCalled,
            "signUp(with:) should ask LoginWorker to store token"
        )

        XCTAssertTrue(
            loginPresentationLogicSpy.presentCategoriesCalled,
            "signUp(with:) should ask the presenter to present categories"
        )
    }

    func testAskLoginWorkerToSignUpAndPresentSignUpError() {
        // Given
        let email: String? = nil

        let loginPresentationLogicSpy = LoginPresentationLogicSpy()
        sut.presenter = loginPresentationLogicSpy

        let loginExternalCallsSpy = LoginExternalCallsSpy()
        sut.worker = loginExternalCallsSpy

        // When
        sut.signUp(with: email)

        // Then
        XCTAssertTrue(
            loginExternalCallsSpy.signUpCalled,
            "signUp(with:) should ask LoginWorker to sign up"
        )

        XCTAssertFalse(
            loginExternalCallsSpy.storeAccessTokenCalled,
            "signUp(with:) should ask LoginWorker to not store token"
        )

        XCTAssertTrue(
            loginPresentationLogicSpy.presentSignUpErrorCalled,
            "signUp(with:) should ask the presenter to present sign up error"
        )
    }

}
