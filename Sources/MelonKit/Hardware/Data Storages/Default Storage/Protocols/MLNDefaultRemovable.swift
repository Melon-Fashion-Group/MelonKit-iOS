//
//  MLNDefaultRemovable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultRemovable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDefaultRemovable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func remove(forKey key: String) async -> Bool

    ///
    ///
    ///
    func removeAll() async -> Bool
}
