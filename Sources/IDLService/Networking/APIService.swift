//
//  APIService.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/13/23.
//

import Foundation
import SwiftProtobuf

protocol APIService {

    func request(
        with request: URLRequest,
        maxRetries: UInt,
        retryDelay: TimeInterval,
        completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void
    )
}

extension APIService {

    private var validError: (TwirpError) -> Bool {
        return { error in
            guard case let .dataTaskError(error) = error,
                       let urlError = error as? URLError
            else { return true }

            switch urlError.code {
                // Retry on network errors
            case .networkConnectionLost,.timedOut, .cannotFindHost, .cannotConnectToHost, .secureConnectionFailed, .notConnectedToInternet, .cannotLoadFromNetwork, .dataNotAllowed, .resourceUnavailable:
                return true
            default:
                // Do not retry on other errors
                return false
            }
        }
    }

    func shouldRetry(after error: TwirpError, maxRetries: UInt, retryDelay: TimeInterval) -> TimeInterval? {
        guard validError(error) else { return nil }

        let delayMultiplier = 2.0
        return maxRetries > .zero ? pow(delayMultiplier, Double(maxRetries)) * retryDelay : nil
    }
}

final class APIClient: APIService {

    private let session = URLSession.shared

    public func request(
        with request: URLRequest,
        maxRetries: UInt,
        retryDelay: TimeInterval,
        completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void
    ) {

        self.request(with: request) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success:
                completion(result)
            case .failure(let error):
                if let delay = self.shouldRetry(after: error, maxRetries: maxRetries, retryDelay: retryDelay) {
                    DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                        self.request(
                            with: request,
                            maxRetries: maxRetries - 1,
                            retryDelay: retryDelay,
                            completion: completion)
                    }
                } else {
                    completion(result)
                }
            }
        }
    }

    func request(
        with request: URLRequest,
        completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void
    ) {
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(.dataTaskError(error)))
                    return
                }

                guard let data, !data.isEmpty else {
                    completion(.failure(.noData))
                    return
                }

                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(.failure(.invalidHTTPResponse))
                    return
                }

                completion(.success((data, httpResponse)))
            }
        }

        task.resume()
    }
}
