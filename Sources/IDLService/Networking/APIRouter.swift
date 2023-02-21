//
//  APIRouter.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/17/23.
//

import Foundation

enum APIRouter {
    case themes

    var route: String {
        switch self {
        case .themes: return "/twirp/chesscom.themes.v1alpha.ThemesService/"
        }
    }
}
