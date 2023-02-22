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

    var errorValidatorLogic: (TwirpError) -> Bool {
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
}

final class APIClient: APIService {

    private let session = URLSession.shared

    public func request(
        with request: URLRequest,
        maxRetries: UInt,
        retryDelay: TimeInterval,
        completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void
    ) {
        let retry: ((TwirpError) -> Bool, TwirpError, UInt) -> TimeInterval? = { errorValidator, error, retryCount in
            guard errorValidator(error) else { return nil }

            return retryCount > .zero ? pow(Constant.delayMultiplier, Double(retryCount)) * retryDelay : nil
        }

        let localLogicCopy = errorValidatorLogic

        self.request(with: request) { [weak self] result in
            switch result {
            case .success:
                completion(result)
            case .failure(let error):
                if let delay = retry(localLogicCopy, error, maxRetries) {
                    DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
                        self?.request(
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

private extension APIClient {

    enum Constant {
        static let delayMultiplier = 2.0
    }
}
