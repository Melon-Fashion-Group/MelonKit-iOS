//
//  MLNDevice.Device.Model.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Device.Model

extension MLNDevice.Device {

    ///
    /// An enumeration representing a list of device models.
    ///
    public enum Model: String {

        ///
        ///
        ///
        case iPod_touch = "iPod touch"

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
        case unknown = "Unknown device model"
    }
}
