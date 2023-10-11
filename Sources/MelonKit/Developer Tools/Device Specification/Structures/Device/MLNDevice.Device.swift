//
//  MLNDevice.Device.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.Device

extension MLNDevice {

    ///
    /// A structure describing the type, model, and name of the current device.
    ///
    public struct Device {

        ///
        /// A property that allows you to get the type of the current device.
        ///
        public let type: `Type`

        ///
        /// A property that allows you to get the model of the current device.
        ///
        public let model: Model

        ///
        /// A property that allows you to get the name of the current device.
        ///
        public let name: Name

        init(
            type: `Type` = .unknown,
            model: Model = .unknown,
            name: Name = .undefined
        ) {
            self.type = type
            self.model = model
            self.name = name
        }
    }
}
