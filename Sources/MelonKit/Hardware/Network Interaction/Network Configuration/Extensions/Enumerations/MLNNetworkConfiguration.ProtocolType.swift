//
//  MLNNetworkConfiguration.ProtocolType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNNetworkConfiguration.ProtocolType

extension MLNNetworkConfiguration {

    // MARK: - Public enumerations

    ///
    ///
    ///
    public enum ProtocolType: String {

        ///
        ///
        ///
        case http

        ///
        ///
        ///
        case https

        ///
        ///
        ///
        case websocket = "ws"
    }
}
