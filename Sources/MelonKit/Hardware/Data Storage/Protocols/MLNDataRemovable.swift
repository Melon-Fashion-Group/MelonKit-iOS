//
//  MLNDataRemovable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataRemovable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDataRemovable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func remove(forKey key: String) -> Bool

    ///
    ///
    ///
    func remove(forKeys keys: [String]) -> Bool

    ///
    ///
    ///
    func removeAll() -> Bool
}
