//
//  NetworkMonitor.swift
//  SwiftIDLClient
//
//  Created by Roman Kavinskyi on 1/18/23.
//


import Foundation
import Network
import SystemConfiguration

enum NetworkStatus {
    case online, offline
}

final class NetworkMonitor {
    
    static let shared = NetworkMonitor()

    var networkStatus: NetworkStatus {
        isConnectedToNetwork ? .online : .offline
    }

    private init() {}

    private var isConnectedToNetwork: Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
        zeroAddress.sin_family = sa_family_t(AF_INET)

        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }

        guard let defaultRouteReachability = defaultRouteReachability else { return false}

        var flags: SCNetworkReachabilityFlags = []

        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) { return false }

        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)

        return (isReachable && !needsConnection)
    }
}
