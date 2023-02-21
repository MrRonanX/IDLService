//
//  ThemesServiceClient.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 2/13/23.
//


import Foundation
import SwiftProtobuf

public final class ThemesServiceClient {

    public typealias ListThemesResponseResult = Result<Chesscom_Themes_V1alpha_ListThemesResponse, TwirpError>

    private var requestConstructor: RequestConstructor
    private weak var client: APIService?

    public init(baseURL: String, client: APIService = APIClient()) {
        self.requestConstructor = RequestConstructor(url: baseURL, router: .themes)
        self.client = client
    }

    public func ListThemes(
        request: Chesscom_Themes_V1alpha_ListThemesRequest,
        retryTimes: UInt = 0,
        headers: [String: String] = [:],
        completion: @escaping (ListThemesResponseResult) -> Void
    ) {
        let endpoint = "ListThemes"

        guard NetworkMonitor.shared.networkStatus == .online else {
            completion(.failure(.offline))
            return
        }

        guard let bodyData = try? request.serializedData() else {
            completion(.failure(.invalidInitialData))
            return
        }

        guard let request = try? requestConstructor.request(headers: headers, body: bodyData, path: endpoint) else {
            completion(.failure(.invalidURLRequest))
            return
        }

        client?.retriableClient(with: retryTimes).request(with: request) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success((let data, let response)):
                APIClientMapper.map(data, from: response, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }

        // TODO: func ListThemesJson(
    }
}
