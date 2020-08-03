@testable import iddog
import XCTest

class LoginWorkerTests: XCTestCase {
    // MARK: Subject under test

    var sut: LoginWorker!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupLoginWorker()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupLoginWorker() {
        sut = LoginWorker(
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
        var setAccessTokenAsyncCalled =  false

        func getAccessTokenSync() -> String? {
            return nil
        }

        func setAccessTokenAsync(_ token: String?) {
            setAccessTokenAsyncCalled = true
        }

        func clear() {}

        init(service: SecurityServiceProtocol = SecurityServiceSpy()) {
            self.service = service
        }
    }

    class NetworkProviderSpy: NetworkProviderProtocol {
        var performRequestCalled = false

        func performRequest<T: Decodable>(endpoint: EndpointDescriptor, result: @escaping ResultHandler<T>) {
            performRequestCalled = true
        }
    }

    // MARK: Tests

    func testWorkerAskToCredentialStorageToStoreAccessToken() {
        // Given
        let token = "token"

        //swiftlint:disable:next force_cast
        let crendentialsStorageSpy = sut.credentialStorage as! CrendentialsStorageSpy

        // When
        sut.storeAccessToken(token)

        // Then
        XCTAssertTrue(
            crendentialsStorageSpy.setAccessTokenAsyncCalled,
            "Calling storeAccessToken(token) should ask to credentialsStorage to store token"
        )
    }

    func testWorkerAskToNetworkProviderToSignUp() {
        // Given
        let email = "teste@teste.com"

        //swiftlint:disable:next force_cast
        let networkProviderSpy = sut.network as! NetworkProviderSpy

        // When
        sut.signUp(with: email) { _ in }

        // Then
        XCTAssertTrue(
            networkProviderSpy.performRequestCalled,
            "Calling sut.signUp(with: email) should ask to network to signUp"
        )
    }

    func testWorkerNotAskToNetworkProviderToSignUp() {
        // Given
        let email: String? = nil

        //swiftlint:disable:next force_cast
        let networkProviderSpy = sut.network as! NetworkProviderSpy

        // When
        sut.signUp(with: email) { _ in }

        // Then
        XCTAssertFalse(
            networkProviderSpy.performRequestCalled,
            "Calling sut.signUp(with: email) should not ask to network to signUp"
        )
    }
}
