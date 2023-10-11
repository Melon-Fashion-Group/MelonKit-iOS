//
//  MLNDevice.Hardware.IMU.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Hardware.IMU

extension MLNDevice.Hardware {

    ///
    /// A structure describing the availability of IMU section sensors.
    ///
    public struct IMU {

        ///
        ///
        ///
        public let accelerometer: SensorAvailability

        ///
        ///
        ///
        public let barometer: SensorAvailability

        ///
        ///
        ///
        public let gyroscope: SensorAvailability

        ///
        ///
        ///
        public let magnetometer: SensorAvailability

        init(
            accelerometer: SensorAvailability = .unavailable,
            barometer: SensorAvailability = .unavailable,
            gyroscope: SensorAvailability = .unavailable,
            magnetometer: SensorAvailability = .unavailable
        ) {
            self.accelerometer = accelerometer
            self.barometer = barometer
            self.gyroscope = gyroscope
            self.magnetometer = magnetometer
        }
    }
}
