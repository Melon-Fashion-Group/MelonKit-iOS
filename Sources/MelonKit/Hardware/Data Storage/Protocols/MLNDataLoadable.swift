//
//  MLNDataLoadable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataLoadable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDataLoadable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func load<Object: MLNDataDecodable>(_ object: inout Object, forKey key: String) -> Bool

    ///
    ///
    ///
    func load<Object: MLNDataDecodable>(_ objects: inout [Object], forKeys keys: [String]) -> Bool
}
