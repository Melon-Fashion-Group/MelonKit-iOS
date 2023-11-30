//
//  MLNDefaultLoadable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultLoadable

///
///
///
@available(iOS 16.0, *)
public protocol MLNDefaultLoadable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func load<Object: MLNDefaultDecodable>(_ object: inout Object, forKey key: String) -> Bool

    ///
    ///
    ///
    func load<Object: MLNDefaultDecodable>(_ objects: inout [Object], forKeys keys: [String]) -> Bool
}
