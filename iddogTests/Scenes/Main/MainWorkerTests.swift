@testable import iddog
import XCTest

class MainWorkerTests: XCTestCase {
    // MARK: Subject under test

    var sut: MainWorker!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupMainWorker()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupMainWorker() {
        sut = MainWorker(credentialStorage: CrendentialsStorageSpy())
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
        var getAccessTokenSyncCalled =  false

        func getAccessTokenSync() -> String? {
            getAccessTokenSyncCalled = true
            return "token"
        }

        func setAccessTokenAsync(_ token: String?) {}

        func clear() {}

        init(service: SecurityServiceProtocol = SecurityServiceSpy()) {
            self.service = service
        }
    }

    // MARK: Tests

    func testWokerAskToCredentialStorageAndShouldReturnToken() {
        // Given
        //swiftlint:disable:next force_cast
        let crendentialsStorageSpy = sut.credentialStorage as! CrendentialsStorageSpy
        var fetchedToken: String?
        // When
        sut.requestCrendentials { token in
            fetchedToken = token
        }
        // Then
        XCTAssertTrue(
            crendentialsStorageSpy.getAccessTokenSyncCalled,
            "Calling requestCrendentials() should ask to credentialsStorage for a token"
        )

        XCTAssertEqual(fetchedToken, "token")
    }
}
