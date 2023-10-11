//
//  MLNNetworkConfiguration.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNNetworkConfiguration

///
///
///
@available(iOS 15.0, *)
open class MLNNetworkConfiguration: MLNNetworkConfigurable {

    // MARK: - Public properties

    ///
    ///
    ///
    open var `protocol`: ProtocolType { .https }

    ///
    ///
    ///
    open var test: String { "" }

    ///
    ///
    ///
    open var prefix: String { "" }

    ///
    ///
    ///
    open var name: String { "" }

    ///
    ///
    ///
    open var domain: String { "" }

    ///
    ///
    ///
    open var path: String { "" }

    ///
    ///
    ///
    open var anchor: String { "" }



    // MARK: - Private propertiess

    private let colon = ":"

    private let dot = "."

    private let slash = "/"



    // MARK: - Init

    public init() { }



    // MARK: - Public methods

    ///
    ///
    ///
    open func getURL(for endpoint: Endpoint = .main) -> URL? {
        let urlString = createURLString(endpoint: endpoint)

        return .init(string: urlString)
    }



    // MARK: - Private functions

    private func createURLString(endpoint: Endpoint) -> String {
        let `protocol` = "\(`protocol`.rawValue)\(colon)\(slash)\(slash)"

        let test = test.isEmpty ? "" : "\(test)\(dot)"

        let prefix = prefix.isEmpty ? "" : "\(prefix)\(dot)"

        let name = name.isEmpty ? "" : "\(name)\(dot)"

        let domain = domain.isEmpty ? "" : "\(domain)\(slash)"

        let path = path.isEmpty ? "" : "\(path)\(slash)"

        let anchor = anchor.isEmpty ? "" : "\(anchor)\(slash)"

        let endpoint = endpoint.rawValue

        return "\(`protocol`)\(test)\(prefix)\(name)\(domain)\(path)\(anchor)\(endpoint)"
    }
}
