//
//  MLNDevice.Device.Type.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Device.Type

extension MLNDevice.Device {

    ///
    /// An enumeration representing a list of device types.
    ///
    public enum `Type`: String {

        ///
        ///
        ///
        case iPod = "iPod"

        ///
        ///
        ///
        case iPhone = "iPhone"

        ///
        ///
        ///
        case iPad = "iPad"

        ///
        ///
        ///
        case unknown = "Unknown device type"
    }
}
