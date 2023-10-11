//
//  MLNDevice.Hardware.Connectivity.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Hardware.Connectivity

extension MLNDevice.Hardware {

    ///
    /// A structure describing the availability of sensors in the Connectivity section.
    ///
    public struct Connectivity {

        ///
        ///
        ///
        public let gps: SensorAvailability

        ///
        ///
        ///
        public let iBeacon: SensorAvailability

        ///
        ///
        ///
        public let bluetooth: SensorAvailability

        init(
            gps: SensorAvailability = .unavailable,
            iBeacon: SensorAvailability = .unavailable,
            bluetooth: SensorAvailability = .unavailable
        ) {
            self.gps = gps
            self.iBeacon = iBeacon
            self.bluetooth = bluetooth
        }
    }
}
