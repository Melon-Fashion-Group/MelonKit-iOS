//
//  MLNDevice.Hardware.Network.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Hardware.Network

extension MLNDevice.Hardware {

    ///
    /// A structure describing the availability of sensors in the Network section.
    ///
    public struct Network {

        ///
        ///
        ///
        public let cellular: SensorAvailability

        ///
        ///
        ///
        public let wifi: SensorAvailability

        init(
            cellular: SensorAvailability = .unavailable,
            wifi: SensorAvailability = .unavailable
        ) {
            self.cellular = cellular
            self.wifi = wifi
        }
    }
}
