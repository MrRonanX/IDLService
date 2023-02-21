//
//  HTTPURLResponse+Extensions.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/14/23.
//

import Foundation

extension HTTPURLResponse {
    var hasProtobufHeaders: Bool {
        guard let contentType = allHeaderFields[HTTPHeaderField.contentType] as? String else {
            return false
        }

        return contentType == ContentType.protobuf
    }
}
