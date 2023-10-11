//
//  MLNDevice.Hardware.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Hardware

extension MLNDevice {

    ///
    /// A structure that describes the availability of sensors on the hardware component of the current device.
    ///
    public struct Hardware {

        ///
        /// A property that allows you to get information about the sensors of the Connectivity section.
        ///
        public let connectivity: Connectivity

        ///
        /// A property that allows you to get information about the sensors of the IMU section.
        ///
        public let imu: IMU

        ///
        /// A property that allows you to get information about the sensors of the Network section.
        ///
        public let network: Network

        init(
            connectivity: Connectivity = .init(),
            imu: IMU = .init(),
            network: Network = .init()
        ) {
            self.connectivity = connectivity
            self.imu = imu
            self.network = network
        }
    }
}
