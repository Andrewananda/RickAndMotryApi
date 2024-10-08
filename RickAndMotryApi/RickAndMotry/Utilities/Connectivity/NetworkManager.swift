//
//  NetworkManager.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import Foundation
import Network


class NetworkManager {
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")

    var isConnected: Bool = false

    init() {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isConnected = true
            } else {
                self.isConnected = false
            }
            
            print("Path: \(path)")
            print("Path Status: \(path.status)")
            print("Available Interfaces: \(path.availableInterfaces)")
            print("Expensive: \(path.isExpensive)")
        }

        monitor.start(queue: queue)
    }
    
    deinit {
        monitor.cancel()
    }
}
