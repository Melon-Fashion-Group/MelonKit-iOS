//
//  MLNDeviceSpecificationable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDeviceSpecificationable

///
/// A protocol describing iOS / iPadOS device specifications.
///
@available(iOS 15.0, *)
public protocol MLNDeviceSpecificationable: MLNServiceable {

    // MARK: - Static properties

    ///
    ///
    ///
    static var current: MLNDeviceSpecificationable { get }



    // MARK: - Public properties

    ///
    /// A property that allows you to get information about the current device.
    ///
    var device: MLNDevice.Device { get }

    ///
    /// A property that allows you to get information about the current version of the operating system.
    ///
    var operatingSystem: MLNDevice.OperatingSystem { get }

    ///
    /// A property that allows you to get information about the current device software.
    ///
    var software: MLNDevice.Software { get }

    ///
    /// A property that allows you to get information about the current hardware of the device.
    ///
    var hardware: MLNDevice.Hardware { get }

    ///
    /// A property that allows you to get the full specification of the current device.
    ///
    var specification: MLNDevice.Specification { get }
}
