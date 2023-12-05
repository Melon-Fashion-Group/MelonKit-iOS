//
//  MLNDefaultLoadable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultLoadable

///
///
///
@available(iOS 15.0, *)
public protocol MLNDefaultLoadable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func load<Object: MLNDefaultDecodable>(_ type: Object.Type, forKey key: String) -> Object?

    ///
    ///
    ///
    func load<Object: MLNDefaultDecodable>(_ type: Object.Type, forKeys keys: [String]) -> [Object]?
}
