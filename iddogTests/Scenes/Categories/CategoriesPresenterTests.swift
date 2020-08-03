@testable import iddog
import XCTest

class CategoriesPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: CategoriesPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupCategoriesPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupCategoriesPresenter() {
        sut = CategoriesPresenter()
    }

    // MARK: Test doubles

    class CategoriesDisplayLogicSpy: CategoriesDisplayLogic {
        var displayLoginCalled = false
        var displayLogoutConfirmationCalled =  false
        var displayCategoriesCalled = false
        var displayCategoryGalleryCalled = false

        func displayLogin() {
            displayLoginCalled = true
        }

        func displayLogoutConfirmation() {
            displayLogoutConfirmationCalled = true
        }

        func displayCategories(_ categories: CategoriesModel) {
            displayCategoriesCalled = true
        }

        func displayCategoryGallery() {
            displayCategoryGalleryCalled = true
        }
    }

    // MARK: Tests

    func testPresentLogin() {
        // Given
        let categoriesDisplayLogicSpy = CategoriesDisplayLogicSpy()
        sut.viewController = categoriesDisplayLogicSpy

        // When
        sut.presentLogin()

        // Then
        XCTAssertTrue(
            categoriesDisplayLogicSpy.displayLoginCalled,
            "presentLogin() should ask the view controller to display the login"
        )
    }

    func testPresentCategories() {
        // Given
        let categoriesDisplayLogicSpy = CategoriesDisplayLogicSpy()
        sut.viewController = categoriesDisplayLogicSpy

        let categories = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            )
        ]

        // When
        sut.presentCategories(categories)

        // Then
        XCTAssertTrue(
            categoriesDisplayLogicSpy.displayCategoriesCalled,
            "presentCategories(_ categories: CategoriesModel) should ask the view controller to display the categories"
        )
    }

    func testPresentCategoryGallery() {
        // Given
        let categoriesDisplayLogicSpy = CategoriesDisplayLogicSpy()
        sut.viewController = categoriesDisplayLogicSpy

        // When
        sut.presentCategoryGallery()

        // Then
        XCTAssertTrue(
            categoriesDisplayLogicSpy.displayCategoryGalleryCalled,
            "presentCategoryGallery() should ask the view controller to display the category gallery"
        )

    }

}
