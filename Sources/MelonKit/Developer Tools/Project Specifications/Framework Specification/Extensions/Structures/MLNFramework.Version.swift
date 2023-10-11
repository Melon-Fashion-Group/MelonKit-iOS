//
//  MLNFramework.Version.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNFramework.Version

extension MLNFramework {

    // MARK: - Public structures

    ///
    /// A structure describing the version of the framework as a major.minor.patch.
    ///
    public struct Version {

        ///
        /// A property that allows you to get the major version of the framework.
        ///
        public var major: UInt16

        ///
        /// A property that allows you to get the minor version of the framework.
        ///
        public var minor: UInt16

        ///
        /// A property that allows you to get the patch version of the framework.
        ///
        public var patch: UInt16
    }
}
