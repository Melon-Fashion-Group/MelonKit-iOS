//
//  MLNFrameworkSpecificationable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNFrameworkSpecificationable

///
/// A protocol that describes the framework specification.
///
@available(iOS 15.0, *)
public protocol MLNFrameworkSpecificationable: MLNServiceable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNFrameworkSpecificationable protocol.
    ///
    static var info: MLNFrameworkSpecificationable { get }



    // MARK: - Public properties

    ///
    /// A property that allows you to get the version of the framework being used.
    ///
    var version: MLNFramework.Version { get }

    ///
    /// A property that allows you to get the build version of the framework being used.
    ///
    var build: MLNFramework.Build { get }
}
