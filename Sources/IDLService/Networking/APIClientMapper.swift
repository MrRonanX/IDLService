//
//  APIClientMapper.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/22/23.
//

import Foundation
import SwiftProtobuf

struct APIClientMapper {

    static func map<T: Message>(
        _ data: Data,
        from httpResponse: HTTPURLResponse,
        completion: @escaping (Result<T, TwirpError>) -> Void
    ) {
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
