//
//  MLNNetworkConfiguration.Endpoint.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNNetworkConfiguration.Endpoint

extension MLNNetworkConfiguration {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Endpoint: RawRepresentable {

        ///
        ///
        ///
        public static let main = Endpoint(rawValue: "")

        ///
        ///
        ///
        public var rawValue: String

        ///
        ///
        ///
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
