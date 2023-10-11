//
//  MLNAppSpecificationable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNAppSpecificationable

///
/// A protocol that describes the app specification.
///
@available(iOS 15.0, *)
public protocol MLNAppSpecificationable: MLNServiceable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNAppSpecificationable protocol.
    ///
    static var info: MLNAppSpecificationable { get }



    // MARK: - Public properties

    ///
    /// A property that allows you to get the version of the running app.
    ///
    var version: MLNApp.Version { get }

    ///
    /// A property that allows you to get the build version of the running app.
    ///
    var build: MLNApp.Build { get }
}
