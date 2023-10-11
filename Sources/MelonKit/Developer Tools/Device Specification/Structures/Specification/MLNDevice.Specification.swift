//
//  MLNDevice.Specification.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Specification

extension MLNDevice {

    ///
    /// A structure describing the full specification of the current device.
    ///
    public struct Specification {

        ///
        /// A property that allows you to get information about the current device.
        ///
        public var device: Device

        ///
        /// A property that allows you to get information about the current version of the operating system.
        ///
        public var operatingSystem: OperatingSystem

        ///
        /// A property that allows you to get information about the current device software.
        ///
        public var software: Software

        ///
        /// A property that allows you to get information about the current hardware of the device.
        ///
        public var hardware: Hardware

        init(
            device: Device = .init(),
            operatingSystem: OperatingSystem = .init(),
            software: Software = .init(),
            hardware: Hardware = .init()
        ) {
            self.device = device
            self.operatingSystem = operatingSystem
            self.software = software
            self.hardware = hardware
        }
    }
}
