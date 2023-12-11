//
//  MLNKeychainLoadable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNKeychainLoadable

///
///
///
@available(iOS 15.0, *)
public protocol MLNKeychainLoadable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func load<Object: MLNDataDecodable>(_ type: Object.Type, for service: String, with account: String) -> Object?
}
