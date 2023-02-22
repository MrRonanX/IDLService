//
//  RequestConstructor.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 1/18/23.
//

import Foundation

struct RequestConstructor {

    private let baseURL: String
    private let router: APIRouter

    init(url: String, router: APIRouter) {
        baseURL = url
        self.router = router
    }

    func request(headers: [String: String], body: Data?, path: String) throws -> URLRequest {
        let url = try baseURL.asURL()

        var request = URLRequest(url: url.appendingPathComponent(router.route + path))
        request.httpMethod = Constant.methodPOST
        request.setValue(ContentType.protobuf, forHTTPHeaderField: HTTPHeaderField.contentType)
        headers.forEach {
            request.setValue($1, forHTTPHeaderField: $0)
        }
        request.httpBody = body
        return request
    }
}

private extension RequestConstructor {

    enum Constant {
        static let methodPOST = "POST"
    }
}

enum HTTPHeaderField {
    static let contentType = "Content-Type"
}

enum ContentType {
    static let json = "Application/json"
    static let protobuf = "application/protobuf"
}
