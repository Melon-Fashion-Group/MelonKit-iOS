//
//  MLNDataReplaceable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataReplaceable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDataReplaceable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func replace<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool

    ///
    ///
    ///
    func replace<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool
}
