//
//  ErrorResponse.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/13/23.
//

import Foundation

public struct ErrorResponse: Codable, Equatable {
    let code: String
    let msg: String
    let meta: [String: String]?
}
