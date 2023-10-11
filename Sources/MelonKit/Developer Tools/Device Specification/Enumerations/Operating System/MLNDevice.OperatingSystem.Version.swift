//
//  MLNDevice.OperatingSystem.Version.swift
//  MelonKit
//
//  Created by Dimka Novikov on 09.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDevice.OperatingSystem.Version

extension MLNDevice.OperatingSystem {

    ///
    /// A structure representing the version of the operating system.
    ///
    public struct Version {

        ///
        ///
        ///
        public var major: UInt16

        ///
        ///
        ///
        public var minor: UInt16

        ///
        ///
        ///
        public var patch: UInt16

        init(
            major: UInt16 = 0,
            minor: UInt16 = 0,
            patch: UInt16 = 0
        ) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
    }
}
