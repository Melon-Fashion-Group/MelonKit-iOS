//
//  MLNServiceContainerable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNServiceContainerable

///
///
///
@available(iOS 15.0, *)
public protocol MLNServiceContainerable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    static func register<Service: MLNServiceable>(type: Service.Type, _ factory: @autoclosure @escaping () -> Service)

    ///
    ///
    ///
    static func resolve<Service: MLNServiceable>(_ resolveType: MLNServiceType, _ type: Service.Type) -> Service?
}
