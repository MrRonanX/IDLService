//
//  String+Extensions.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/16/23.
//

import Foundation

protocol URLConvertible {
    func asURL() throws -> URL
}

extension String: URLConvertible {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else { throw TwirpError.invalidURL(self) }
        return url
    }
}
