//
//  TwirpError.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/13/23.
//

import Foundation

public enum TwirpError: Error, Equatable {
    case invalidURL(String?)
    case invalidURLRequest
    case invalidHTTPResponse
    case invalidInitialData
    case message(String?)
    case error(code: Int, errorObject: ErrorResponse?)
    case noData
    case decodingError
    case offline
}
