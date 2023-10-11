//
//  MLNApp.Version.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNApp.Version

extension MLNApp {

    // MARK: - Public structures

    ///
    /// A structure describing the version of the app as a major.minor.patch.
    ///
    public struct Version {

        ///
        /// A property that allows you to get the major version of the app.
        ///
        public var major: UInt16

        ///
        /// A property that allows you to get the minor version of the app.
        ///
        public var minor: UInt16

        ///
        /// A property that allows you to get a patch version of the app.
        ///
        public var patch: UInt16
    }
}
