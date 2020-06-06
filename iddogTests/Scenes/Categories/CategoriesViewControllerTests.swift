@testable import iddog
import XCTest

class CategoriesViewControllerTests: XCTestCase {
    // MARK: Subject under test

    var sut: CategoriesViewController!
    var window: UIWindow!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupCategoriesViewController()
    }

    override func tearDown() {
        window = nil
        super.tearDown()
    }

    // MARK: Test setup

    func setupCategoriesViewController() {
        sut = CategoriesViewController()
    }

    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }

    // MARK: Test doubles

    class CategoriesBusinessLogicSpy: CategoriesBusinessLogic {
        var logoutCalled = false
        var fetchCategoriesCalled = false
        var setCategoryNameOnDataStoreCalled = false

        func logout() {
            logoutCalled = true
        }

        func fetchCategories() {
            fetchCategoriesCalled = true
        }

        func setCategoryNameOnDataStore(_ name: String) {
            setCategoryNameOnDataStoreCalled = true
        }
    }

    class CategoriesRountingLogicSpy: CategoriesRouterType {
        var routeToLoginCalled = false
        var routeToLogoutConfirmationCalled = false
        var dismissLogoutAlertCalled = false
        var routeToCategoryGalleryCalled = false

        var dataStore: CategoriesDataStore?

        func routeToLogin() {
            routeToLoginCalled = true
        }

        func routeToLogoutConfirmation(_ alert: UIAlertController) {
            routeToLogoutConfirmationCalled = true
        }

        func dismissLogoutAlert() {
            dismissLogoutAlertCalled = true
        }

        func routeToCategoryGallery() {
            routeToCategoryGalleryCalled = true
        }
    }

    class TableViewSpy: UITableView {
        var reloadDataCalled = false

        override func reloadData() {
            reloadDataCalled = true
        }
    }

    // MARK: Tests

    func testShouldFetchCategoriesWhenViewIsLoaded() {
        // Given
        let categoriesBusinessLogicSpy = CategoriesBusinessLogicSpy()
        sut.interactor = categoriesBusinessLogicSpy

        // When
        loadView()

        // Then
        XCTAssertTrue(
            categoriesBusinessLogicSpy.fetchCategoriesCalled,
            "viewDidLoad() should ask the interactor to fetch categories"
        )
    }

    func testDisplayCategories() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy

        // When
        let displayedCategories: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            )
        ]

        sut.displayCategories(displayedCategories)

        // Then
        XCTAssert(
            tableViewSpy.reloadDataCalled,
            "Displaying fetched categories should reload the table view"
        )
    }

    func testDisplayCategoryGallery() {
        // Given
        let categoryRouterSpy = CategoriesRountingLogicSpy()
        sut.router = categoryRouterSpy

        // When
        sut.displayCategoryGallery()

        // Then
         XCTAssert(
            categoryRouterSpy.routeToCategoryGalleryCalled,
            "Displaying a successfully category gallery scene"
        )
    }

    func testDisplayLogoutConfirmation() {
        // Given
        let categoryRouterSpy = CategoriesRountingLogicSpy()
        sut.router = categoryRouterSpy

        // When
        sut.displayLogoutConfirmation()

        // Then
         XCTAssert(
            categoryRouterSpy.routeToLogoutConfirmationCalled,
            "Displaying a successfully logout confirmation alert"
        )

    }

    func testDisplayLogin() {
        // Given
        let categoryRouterSpy = CategoriesRountingLogicSpy()
        sut.router = categoryRouterSpy

        // When
        sut.displayLogin()

        // Then
         XCTAssert(
            categoryRouterSpy.routeToLoginCalled,
            "Displaying a successfully login scene"
        )
    }

    func testNumberOfRowsShouldEqualNumberOfCategories() {
        // Given
        let tableView = sut.tableView
        let displayedCategories: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            )
        ]
        sut.categories = displayedCategories

        // When
        let numberOfRows = sut.tableView(tableView, numberOfRowsInSection: 0)

        // Then
        XCTAssertEqual(
            numberOfRows,
            displayedCategories.count,
            "The number of table view rows should equal the number of categories to display"
        )
    }

    func testShouldConfigureCellToDisplayCategory() {
        // Given
        let tableView = sut.tableView
        let displayedCategories: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            )
        ]
        sut.categories = displayedCategories

        // When
        let indexPath = IndexPath(row: .zero, section: .zero)
        let cell = sut.tableView(tableView, cellForRowAt: indexPath)

        // Then
        XCTAssertEqual(
            cell.textLabel?.text,
            "husky",
            "A properly configured table view cell should display the category"
        )

    }

    func testShouldStoreCategoryName() {
        // Given
        let categoriesBusinessLogicSpy = CategoriesBusinessLogicSpy()
        sut.interactor = categoriesBusinessLogicSpy
        let tableView = sut.tableView
        let displayedCategories: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            )
        ]
        sut.categories = displayedCategories

        // When
        let indexPath = IndexPath(row: .zero, section: .zero)
        sut.tableView(tableView, didSelectRowAt: indexPath)

        // Then
        XCTAssert(
            categoriesBusinessLogicSpy.setCategoryNameOnDataStoreCalled,
            "Store category name on select row at table view"
        )

    }

}
