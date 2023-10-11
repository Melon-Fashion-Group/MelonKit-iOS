//
//  MLNDevice.Software.Type.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Software.Type

extension MLNDevice.Software {

    ///
    /// An enumeration that describes a list of application types.
    ///
    public enum `Type`: String {

        ///
        ///
        ///
        case iOS = "iOS native app"

        ///
        ///
        ///
        case unknown = "Unknown software type"
    }
}
