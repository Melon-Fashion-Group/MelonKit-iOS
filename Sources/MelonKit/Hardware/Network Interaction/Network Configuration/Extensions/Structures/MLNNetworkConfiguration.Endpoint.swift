//
//  MLNNetworkConfiguration.Endpoint.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - Endpoint

extension MLNNetworkConfiguration {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Endpoint: RawRepresentable {

        // MARK: - Public properties

        ///
        ///
        ///
        public static let main = Endpoint(rawValue: "")

        ///
        ///
        ///
        public let rawValue: String



        // MARK: - Init

        ///
        ///
        ///
        public init(rawValue: String) {
            self.rawValue = rawValue
        }
    }
}
