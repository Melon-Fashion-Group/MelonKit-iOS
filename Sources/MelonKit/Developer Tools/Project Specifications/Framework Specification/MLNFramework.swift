//
//  MLNFramework.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNFramework

///
/// A class that implements the framework specification.
///
@available(iOS 15.0, *)
public final class MLNFramework: MLNFrameworkSpecificationable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNFrameworkSpecificationable protocol.
    ///
    public static let info: MLNFrameworkSpecificationable = MLNFramework()



    // MARK: - Public properties

    ///
    /// A property that allows you to get the version of the framework being used.
    ///
    public let version = Version(major: 1, minor: 0, patch: 0)

    ///
    /// A property that allows you to get the build version of the framework being used.
    ///
    public let build: Build = 1



    // MARK: - Init

    private init() { }
}
