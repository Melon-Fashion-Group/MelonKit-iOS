//
//  MLNNetworkConfiguration.ProtocolType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - ProtocolType

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
