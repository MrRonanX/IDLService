//
//  IDLServiceTests.swift
//  IDLServiceTests
//
//  Created by Roman Kavinskyi on 2/14/23.
//

import XCTest
import IDLService
@testable import SwiftProtobuf


final class IDLServiceTests: XCTestCase {

    func test_load_once() {
        // Given
        let (sut, client) = createSUT()

        // When
        var capturedResults = [ThemesServiceClient.ListThemesResponseResult]()
        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest()) { capturedResults.append($0) }
        client.complete(with: .decodingError)
        // Then

        XCTAssertEqual(capturedResults.count, 1)
    }

    func test_load_twice() {
        // Given
        let (sut, client) = createSUT()

        // When
        var capturedResults = [ThemesServiceClient.ListThemesResponseResult]()
        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest(), retryTimes: 1) {
            capturedResults.append($0)
        }
        client.complete(with: .noData)
        client.complete(with: .noData, at: 1)

        // Then
        XCTAssertEqual(capturedResults.count, 1)
    }

//    func test_load_5Times() {
//        // Given
//        let (sut, client) = createSUT()
//
//        // When
//        var capturedResults = [ThemesServiceClient.ListThemesResponseResult]()
//        sut.ListThemes(request: Chesscom_Themes_V1alpha_ListThemesRequest(), retryTimes: 4) {
//            capturedResults.append($0)
//        }
//        client.complete(with: .noData)
//        client.complete(with: .noData, at: 1)
//        client.complete(with: .noData, at: 2)
//        client.complete(with: .noData, at: 3)
//        client.complete(with: .noData, at: 4)
//
//        // Then
//        XCTAssertEqual(capturedResults.count, 1)
//    }

    func test_load_doesNotDeliverResultAfterSUTInstanceHasBeenDeallocated() {
        let client = APIServiceStub()
        var sut: ThemesServiceClient? = ThemesServiceClient(baseURL: "https://www.chess-4.com", client: client)

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

        waitForExpectations(timeout: 3)
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
    func createSUT() -> (sut: ThemesServiceClient, client: APIServiceStub) {
        let client = APIServiceStub()
        let sut = ThemesServiceClient(baseURL: "https://www.chess-4.com", client: client)

        trackForMemoryLeaks(client)
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

        func request(with request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void) {
            requests.append((request.url!, completion))
            print("✅✅✅✅")
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

protocol APIServiceWithCompletions: APIService {
    associatedtype T: Message
    var completions: [(Result<T, TwirpError>) -> Void] { get set }
}
