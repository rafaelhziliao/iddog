@testable import iddog
import XCTest

class MainInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: MainInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupMainInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainInteractor() {
        sut = MainInteractor()
    }

    // MARK: Test doubles

    class MainPresentationLogicSpy: MainPresentationLogic {
        var presentCategoriesCalled = false
        var presentLoginCalled = false

        func presentCategories() {
            presentCategoriesCalled = true
        }

        func presentLogin() {
            presentLoginCalled = true
        }
    }

    class MainExternalCallsSpy: MainExternalCalls {
        var requestCrendentialsCalled = false
        var token: String?

        func requestCrendentials(result: (String?) -> Void) {
            requestCrendentialsCalled =  true
            result(token)
        }
    }

    // MARK: Tests

    func testAskMainWorkerToRequestCredentialsAndPresenterToPresentLogin() {
        // Given
        let mainPresentationLogicSpy = MainPresentationLogicSpy()
        sut.presenter = mainPresentationLogicSpy
        let mainExternalCallsSpy = MainExternalCallsSpy()
        mainExternalCallsSpy.token = nil
        sut.worker = mainExternalCallsSpy

        // When
        sut.requestCredentials()

        // Then
        XCTAssertTrue(
            mainExternalCallsSpy.requestCrendentialsCalled,
            "requestCredentials() should ask MainWorker to request credentials"
        )
        XCTAssertTrue(
            mainPresentationLogicSpy.presentLoginCalled,
            "requestCredentials() should ask presenter to present login"
        )
    }

    func testAskMainWorkerToRequestCredentialsAndPresenterToPresentCategories() {
        // Given
        let mainPresentationLogicSpy = MainPresentationLogicSpy()
        sut.presenter = mainPresentationLogicSpy
        let mainExternalCallsSpy = MainExternalCallsSpy()
        mainExternalCallsSpy.token = "token"
        sut.worker = mainExternalCallsSpy

        // When
        sut.requestCredentials()

        // Then
        XCTAssertTrue(
            mainExternalCallsSpy.requestCrendentialsCalled,
            "requestCredentials() should ask MainWorker to request credentials"
        )
        XCTAssertTrue(
            mainPresentationLogicSpy.presentCategoriesCalled,
            "requestCredentials() should ask presenter to present categories"
        )
    }

}
