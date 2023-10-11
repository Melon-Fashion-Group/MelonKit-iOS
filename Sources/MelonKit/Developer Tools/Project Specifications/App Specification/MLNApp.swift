//
//  MLNApp.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNApp

///
/// A class that implements an app specification.
///
@available(iOS 15.0, *)
public final class MLNApp: MLNAppSpecificationable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNAppSpecificationable protocol.
    ///
    public static let info: MLNAppSpecificationable = MLNApp()



    // MARK: - Public properties

    ///
    /// A property that allows you to get the version of the running app.
    ///
    public let version: Version = {
        var version = Version(major: 0, minor: 0, patch: 0)

        guard let string = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return version
        }

        let components = string.components(separatedBy: ["."])

        switch components.count {
        case 3:
            guard let patch = UInt16(components[2]) else { fallthrough }

            version.patch = patch

            fallthrough
        case 2:
            guard let minor = UInt16(components[1]) else { fallthrough }

            version.minor = minor

            fallthrough
        case 1:
            guard let major = UInt16(components[0]) else { fallthrough }

            version.major = major
        default:
            return version
        }

        return version
    }()

    ///
    /// A property that allows you to get the build version of the running app.
    ///
    public let build: Build = {
        guard let string = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return 0
        }

        guard let build = UInt16(string) else {
            return 0
        }

        return build
    }()



    // MARK: - Init

    private init() { }
}
