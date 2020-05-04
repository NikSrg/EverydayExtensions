//
//  NetworkReachabilityService.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 04.05.20.
//  Copyright © 2020 Appcoda. All rights reserved.
//

import Foundation
import Network

public enum NetworkType {
    case wifi
    case cellular
    case unknown
    case none
}

public class NetworkReachabilityService {
    // MARK: - Private Properties

    private let monitor = NWPathMonitor()
    private let monitoringQueue = DispatchQueue(label: "de.melAncHOLY_MAN.networkReachabilityService")

    // MARK: - Public Properties

    public static var shared = NetworkReachabilityService()

    public var networkTypeDidChangeHandler: ((NetworkType) -> Void)?

    public var isConnected: Bool {
        return monitor.currentPath.status == .satisfied
    }

    public private(set) var networkType: NetworkType = .unknown {
        willSet {
            if newValue != networkType {
                networkTypeDidChangeHandler?(newValue)
            }
        }
    }

    // MARK: - Init

    private init() {
    }

    // MARK: - Public Methods

    public func startMonitoring() {
        monitor.start(queue: monitoringQueue)
        monitor.pathUpdateHandler = { _ in
            let availableInterfaces = self.monitor.currentPath.availableInterfaces
            guard let currentType = availableInterfaces.filter({ self.monitor.currentPath.usesInterfaceType($0.type) }).first?.type else {
                self.networkType = .none
                return
            }

            switch currentType {
            case .wifi:
                self.networkType = .wifi

            case .cellular:
                self.networkType = .cellular

            default:
                break
            }
        }
    }

    public func stopMonitoring() {
        monitor.cancel()
    }
}
