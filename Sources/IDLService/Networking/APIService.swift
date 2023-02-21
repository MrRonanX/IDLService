//
//  APIService.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/13/23.
//

import Foundation
import SwiftProtobuf

public protocol APIService {

    func request(with request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void)
}

extension APIService {

    private func fallback(_ fallback: APIService) -> APIService {
        APIServiceWithFallback(primary: self, fallback: fallback)
    }

    func retriableClient(with retryCount: UInt) -> APIService {
        var service: APIService = self
        for _ in 0..<retryCount {
            service = service.fallback(self)
        }
        return service
    }
}

struct APIServiceWithFallback: APIService {

    var primary: APIService
    var fallback: APIService

    func request(with request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void) {
        primary.request(with: request) { result in

            switch result {
            case .success:
                completion(result)
            case .failure:
                fallback.request(with: request, completion: completion)
            }
        }
    }
}

public class APIClient: APIService {

    private let session = URLSession.shared

    public init() {}

    public func request<T: Message>(with request: URLRequest, completion: @escaping (Result<T, TwirpError>) -> Void) {

        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(.message(error?.localizedDescription)))
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

                do {
                    if (200...299).contains(httpResponse.statusCode) {
                        if httpResponse.hasProtobufHeaders {
                            let responseObject = try T(serializedData: data)
                            completion(.success(responseObject))
                        } else {
                            let responseObject = try T(jsonUTF8Data: data)
                            completion(.success(responseObject))
                        }

                    } else {
                        let twirpError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                        completion(.failure(.error(code: httpResponse.statusCode, errorObject: twirpError)))
                    }
                } catch {
                    completion(.failure(.decodingError))
                }
            }
        }
    }

    public func request(with request: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), TwirpError>) -> Void) {

        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    completion(.failure(.message(error?.localizedDescription)))
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


struct APIClientMapper {

    static func map<T: Message>(_ data: Data, from httpResponse: HTTPURLResponse, completion: @escaping (Result<T, TwirpError>) -> Void) {
        do {
            if (200...299).contains(httpResponse.statusCode) {
                if httpResponse.hasProtobufHeaders {
                    let responseObject = try T(serializedData: data)
                    completion(.success(responseObject))
                } else {
                    let responseObject = try T(jsonUTF8Data: data)
                    completion(.success(responseObject))
                }

            } else {
                let twirpError = try JSONDecoder().decode(ErrorResponse.self, from: data)
                completion(.failure(.error(code: httpResponse.statusCode, errorObject: twirpError)))
            }
        } catch {
            completion(.failure(.decodingError))
        }
    }
}
