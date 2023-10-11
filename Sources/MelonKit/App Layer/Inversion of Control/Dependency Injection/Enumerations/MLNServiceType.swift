//
//  MLNServiceType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNServiceType

///
///
///
@available(iOS 15.0, *)
public enum MLNServiceType {

    ///
    ///
    ///
    case new

    ///
    ///
    ///
    case singleton(instance: MLNServiceInstance)
}
