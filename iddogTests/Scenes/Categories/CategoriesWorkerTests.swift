@testable import iddog
import XCTest

class CategoriesWorkerTests: XCTestCase {
    // MARK: Subject under test

    var sut: CategoriesWorker!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupCategoriesWorker()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupCategoriesWorker() {
        sut = CategoriesWorker(
            network: NetworkProviderSpy(),
            credentialStorage: CrendentialsStorageSpy()
        )
    }

    // MARK: Test doubles

    class SecurityServiceSpy: SecurityServiceProtocol {
        func save(_ value: String, forKey key: String) {}

        func get(_ key: String) -> String? {
            return nil
        }

        func clear() -> Bool {
            return false
        }
    }

    class CrendentialsStorageSpy: SecurityStorageProtocol {
        var service: SecurityServiceProtocol
        var clearCalled =  false

        func getAccessTokenSync() -> String? {
            return nil
        }

        func setAccessTokenAsync(_ token: String?) {}

        func clear() {
            clearCalled = true
        }

        init(service: SecurityServiceProtocol = SecurityServiceSpy()) {
            self.service = service
        }
    }

    class NetworkProviderSpy: NetworkProviderProtocol {
        var performRequestCalled = false

        func performRequest<T: Decodable>(endpoint: EndpointProtocol, result: @escaping ResultHandler<T>) {
            performRequestCalled = true
        }
    }

    // MARK: Tests

    func testWorkerAskToCredentialStorageClearData() {
        // Given

        //swiftlint:disable:next force_cast
        let crendentialsStorageSpy = sut.credentialStorage as! CrendentialsStorageSpy

        // When
        sut.clearCredentials()

        // Then
        XCTAssertTrue(
            crendentialsStorageSpy.clearCalled,
            "Calling clearCredentials() should ask to credentialsStorage to clear data"
        )
    }

    func testWorkerFetchCategories() {
        // Given
        let categoriesMock: CategoriesModel = [
            CategoryModel(
                name: "husky",
                hasPhoto: true
            ),
            CategoryModel(
                name: "hound",
                hasPhoto: true
            ),
            CategoryModel(
                name: "pug",
                hasPhoto: true
            ),
            CategoryModel(
                name: "labrador",
                hasPhoto: true
            )
        ]

        var expectedCategories: CategoriesModel = []

        // When
        sut.fecthCategories { categories in
            expectedCategories = categories
        }

        // Then
        XCTAssertEqual(
            categoriesMock.count,
            expectedCategories.count
        )
    }

}
