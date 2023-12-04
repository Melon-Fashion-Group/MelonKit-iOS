//
//  MLNNetworkConfigurable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNNetworkConfigurable

///
///
///
@available(iOS 15.0, *)
public protocol MLNNetworkConfigurable: MLNServiceable {

    // MARK: - Public properties

    ///
    ///
    ///
    var `protocol`: MLNNetworkConfiguration.ProtocolType { get }

    ///
    ///
    ///
    var test: String { get }

    ///
    ///
    ///
    var prefix: String { get }

    ///
    ///
    ///
    var name: String { get }

    ///
    ///
    ///
    var domain: String { get }

    ///
    ///
    ///
    var path: String { get }

    ///
    ///
    ///
    var anchor: String { get }



    // MARK: - Public methods

    ///
    ///
    ///
    func getURL(for endpoint: MLNNetworkConfiguration.Endpoint) -> URL?
}
