@testable import iddog
import XCTest

class CategoriesInteractorTests: XCTestCase {
    // MARK: Subject under test

    var sut: CategoriesInteractor!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupCategoriesInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupCategoriesInteractor() {
        sut = CategoriesInteractor()
    }

    // MARK: Test doubles

    class CategoriesPresentationLogicSpy: CategoriesPresentationLogic {
        var presentLoginCalled = false
        var presentCategoriesCalled = false
        var presentCategoryGalleryCalled = false

        func presentLogin() {
            presentLoginCalled = true
        }

        func presentCategories(_ categories: CategoriesModel) {
            presentCategoriesCalled = true
        }

        func presentCategoryGallery() {
            presentCategoryGalleryCalled = true
        }

    }

    class CategoriesExternalCallsSpy: CategoriesExternalCalls {
        var clearCredentialsCalled = false
        var fecthCategoriesCalled = false

        func clearCredentials() {
            clearCredentialsCalled = true
        }

        func fecthCategories(result: @escaping (CategoriesModel) -> Void) {
            fecthCategoriesCalled = true

            let categoriesModel = [
                CategoryModel(
                    name: "husky",
                    hasPhoto: true
                )
            ]

            result(categoriesModel)
        }

    }

    // MARK: Tests

    func testAskCategoriesWorkerToClearCredentialsAndPresentLogin() {
        // Given
        let categoriesPresentationLogicSpy = CategoriesPresentationLogicSpy()
        sut.presenter = categoriesPresentationLogicSpy
        let categoriesExternalCallsSpy = CategoriesExternalCallsSpy()

        sut.worker = categoriesExternalCallsSpy

        // When
        sut.logout()

        // Then
        XCTAssert(
            categoriesExternalCallsSpy.clearCredentialsCalled,
            "logout() should ask CategoriesWorker to clear credentials"
        )
        XCTAssert(
            categoriesPresentationLogicSpy.presentLoginCalled,
            "logout() should ask presenter to present login"
        )
    }

    func testAskCategoriesWorkerToFetchCategoriesAndPresentCategories() {
        // Given
        let categoriesPresentationLogicSpy = CategoriesPresentationLogicSpy()
        sut.presenter = categoriesPresentationLogicSpy
        let categoriesExternalCallsSpy = CategoriesExternalCallsSpy()

        sut.worker = categoriesExternalCallsSpy

        // When
        sut.fetchCategories()

        // Then
        XCTAssert(
            categoriesExternalCallsSpy.fecthCategoriesCalled,
            "fetchCategories() should ask CategoriesWorker to fetch categories"
        )
        XCTAssert(
            categoriesPresentationLogicSpy.presentCategoriesCalled,
            "fetchCategories() should ask presenter to present categories"
        )
    }

    func testSetCategoryNameOnDataStoreAndPresentCategoryGallery() {
        // Given
        let categoryName = "husky"
        let categoriesPresentationLogicSpy = CategoriesPresentationLogicSpy()
        sut.presenter = categoriesPresentationLogicSpy

        // When
        sut.setCategoryNameOnDataStore(categoryName)

        // Then
        XCTAssertEqual(categoryName, sut.categoryName)

        XCTAssert(
            categoriesPresentationLogicSpy.presentCategoryGalleryCalled,
            "setCategoryNameOnDataStore() should ask presenter to present category gallery"
        )

    }

}
