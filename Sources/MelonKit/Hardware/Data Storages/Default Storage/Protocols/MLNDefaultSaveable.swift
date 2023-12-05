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
    func save<Object: MLNDataEncodable>(_ object: Object, forKey key: String) async -> Bool
}
