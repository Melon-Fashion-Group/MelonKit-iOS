//
//  MLNKeychainRemovable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNKeychainRemovable

@available(iOS 15.0, *)
public protocol MLNKeychainRemovable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func remove(for service: String, with account: String) -> Bool

    ///
    ///
    ///
    func removeAll() -> Bool
}
