//
//  IDLServiceTests.swift
//  IDLServiceTests
//
//  Created by Roman Kavinskyi on 2/14/23.
//

import XCTest
@testable import IDLService
@testable import SwiftProtobuf


final class IDLServiceTests: XCTestCase {

    func test_load_once() {
        // Given
        let (sut, client) = createSUT()
        client.result = .failure(.dataTaskError(URLError(.timedOut)))

        // When
        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest()) { _ in }
        client.complete(with: .decodingError)
        // Then

        XCTAssertEqual(client.retryCount, 0)
    }

    func test_load_twice() {
        // Given
        let (sut, client) = createSUT()
        client.result = .failure(.dataTaskError(URLError(.timedOut)))

        // When
        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest(), retryTimes: 1) { _ in }
        client.complete(with: .noData)

        // Then
        XCTAssertEqual(client.retryCount, 1)
    }

    func test_load_5Times() {
        // Given
        let (sut, client) = createSUT()
        client.result = .failure(.dataTaskError(URLError(.timedOut)))

        // When
        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest(), retryTimes: 4) { _ in }
        client.complete(with: .noData)

        // Then
        XCTAssertEqual(client.retryCount, 4)
    }

    func test_load_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
        let client = APIServiceStub()
        var sut: ThemesServiceClient? = ThemesServiceClient(baseURL: "https://www.chess-4.com", client: client)
        client.result = .failure(.dataTaskError(URLError(.timedOut)))

        var capturedResults = [ThemesServiceClient.ListThemesResponseResult]()
        sut?.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest()) { capturedResults.append($0) }

        sut = nil
        client.complete(with: .noData)

        XCTAssertTrue(capturedResults.isEmpty)
    }

    func test_loadSuccess() {
        let sut = ThemesServiceClient(baseURL: "https://www.chess-4.com")

        var capturedResult: ThemesServiceClient.ListThemesResponseResult?
        let expectation = self.expectation(description: "Waiting for result")
        sut.ListThemes(request: listThemesRequest) {
            capturedResult = $0
            expectation.fulfill()
        }

        waitForExpectations(timeout: 4)
        evaluateCapturedResult(capturedResult)
    }

    func evaluateCapturedResult<T: Message>(
        _ result: (Result<T, TwirpError>)?,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        guard let result else {
            XCTFail("Result is nil")
            return
        }

        switch result {
        case .success: XCTAssertTrue(true)
        case .failure: XCTFail("Request failed")
        }
    }

    var listThemesRequest: Chesscom_Themes_V1alpha_ListThemesRequest {
        var request = Chesscom_Themes_V1alpha_ListThemesRequest()
        request.platform = .iphone
        request.boardSize = 150
        request.piecesSize = 12

        return request
    }
}

// MARK: - Helpers

extension IDLServiceTests {
    func createSUT(
        file: StaticString = #file,
        line: UInt = #line
    ) -> (sut: ThemesServiceClient, client: APIServiceStub) {
        let client = APIServiceStub()
        let sut = ThemesServiceClient(baseURL: "https://www.chess-4.com", client: client)

        trackForMemoryLeaks(client, file: file, line: line)
        trackForMemoryLeaks(sut)

        return (sut: sut, client: client)
    }

    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #file, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(
                instance, "Instance should have been deallocated. Potential memory leak",
                file: file,
                line: line
            )
        }
    }

    class APIServiceStub: APIService {

        private var requestURLs: [URL] { requests.map { $0.url }}
        private var requests: [(url: URL, completion: (Result<(Data, HTTPURLResponse), TwirpError>) -> Void)] = []

        var result: Result<(Data, HTTPURLResponse), TwirpError>?
        var retryCount = 0

        func request(
            with request: URLRequest,
            maxRetries: UInt,
            retryDelay: TimeInterval,
            completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void
        ) {
            let retry: ((TwirpError) -> Bool, TwirpError, UInt) -> TimeInterval? = { errorValidator, error, retryCount in
                guard errorValidator(error) else { return nil }

                return retryCount > .zero ? pow(2.0, Double(retryCount)) * retryDelay : nil
            }

            guard let result else { return }

            let localLogicCopy = errorValidatorLogic

            switch result {
            case .success:
                requests.append((request.url!, completion))
            case .failure(let error):
                if let _ = retry(localLogicCopy, error, maxRetries) {
                    self.request(
                        with: request,
                        maxRetries: maxRetries - 1,
                        retryDelay: retryDelay,
                        completion: completion)
                    retryCount += 1
                } else {
                    requests.append((request.url!, completion))
                }
            }
        }

        func completeWith(data: Data = Data(), at index: Int = 0, code: Int) {
            let response = HTTPURLResponse(
                url: requestURLs[index],
                statusCode: code,
                httpVersion: nil,
                headerFields: nil
            )!

            requests[index].completion(.success((data, response)))
        }

        func complete(with error: TwirpError, at index: Int = 0) {
            requests[index].completion(.failure(error))
        }
    }
}
