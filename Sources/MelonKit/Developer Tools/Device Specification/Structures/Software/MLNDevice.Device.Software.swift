//
//  MLNDevice.Device.Software.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Software

extension MLNDevice {

    ///
    /// A structure describing the application type, simulator environment, and Low Power Mode activity.
    ///
    public struct Software {

        ///
        /// A property that allows you to get the type of application running on the current device.
        ///
        public let type: `Type`

        ///
        /// A property that allows you to get information about whether the simulator environment is used or the application is running on a real device.
        ///
        public let isSimulatorEnvironment: Bool

        ///
        /// A property that allows you to get information about whether the power saving mode is enabled.
        ///
        public let isLowPowerModeEnabled: Bool

        init(
            type: `Type` = .unknown,
            isSimulatorEnvironment: Bool = false,
            isLowPowerModeEnabled: Bool = false
        ) {
            self.type = type
            self.isSimulatorEnvironment = isSimulatorEnvironment
            self.isLowPowerModeEnabled = isLowPowerModeEnabled
        }
    }
}
