@testable import iddog
import XCTest

class MainPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: MainPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupMainPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainPresenter() {
        sut = MainPresenter()
    }

    // MARK: Test doubles

    class MainDisplayLogicSpy: MainDisplayLogic {
        var displayCategoriesCalled = false
        var displayLoginCalled = false

        func displayCategories() {
            displayCategoriesCalled = true
        }

        func displayLogin() {
            displayLoginCalled =  true
        }
    }

    // MARK: Tests

    func testPresentLogin() {
        // Given
        let mainDisplayLogicSpy = MainDisplayLogicSpy()
        sut.viewController = mainDisplayLogicSpy

        // When
        sut.presentLogin()

        // Then
        XCTAssertTrue(
            mainDisplayLogicSpy.displayLoginCalled,
            "presentLogin() should ask the view controller to display the login screen"
        )
    }

    func testPresentCategories() {
        // Given
        let mainDisplayLogicSpy = MainDisplayLogicSpy()
        sut.viewController = mainDisplayLogicSpy

        // When
        sut.presentCategories()

        // Then
        XCTAssertTrue(
            mainDisplayLogicSpy.displayCategoriesCalled,
            "presentCategories() should ask the view controller to display the categories screen"
        )
    }

}
