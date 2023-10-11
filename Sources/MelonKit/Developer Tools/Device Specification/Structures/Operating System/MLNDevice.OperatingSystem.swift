//
//  MLNDevice.OperatingSystem.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.OperatingSystem

extension MLNDevice {

    ///
    /// A structure describing the type, name, and operating system version of the current device.
    ///
    public struct OperatingSystem {

        ///
        /// A property that allows you to get the operating system type of the current device.
        ///
        public let type: `Type`

        ///
        /// A property that allows you to get the operating system name of the current device.
        ///
        public let name: Name

        ///
        /// A property that allows you to get the full name of the operating system of the current device.
        ///
        public let fullname: String

        ///
        /// A property that allows you to get the operating system version of the current device in the major.minor.patch format.
        ///
        public let version: Version

        init(
            type: `Type` = .unknown,
            name: Name = .undefined,
            fullname: String = "",
            version: Version = .init()
        ) {
            self.type = type
            self.name = name
            self.fullname = fullname
            self.version = version
        }
    }
}
