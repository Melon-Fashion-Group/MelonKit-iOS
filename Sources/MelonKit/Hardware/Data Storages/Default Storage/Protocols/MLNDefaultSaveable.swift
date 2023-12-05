//
//  MLNDefaultSaveable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultSaveable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDefaultSaveable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func save<Object: MLNDefaultEncodable>(_ object: Object, forKey key: String) -> Bool

    ///
    ///
    ///
    func save<Object: MLNDefaultEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool
}
