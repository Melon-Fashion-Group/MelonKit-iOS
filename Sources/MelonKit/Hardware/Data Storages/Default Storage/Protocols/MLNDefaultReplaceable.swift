//
//  MLNDefaultReplaceable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultReplaceable

///
///
///
@available(iOS 16.0, *)
public protocol MLNDefaultReplaceable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func replace<Object: MLNDefaultEncodable>(_ object: Object, forKey key: String) -> Bool

    ///
    ///
    ///
    func replace<Object: MLNDefaultEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool
}
