//
//  MLNKeychainStorable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNKeychainStorable

///
///
///
@available(iOS 15.0, *)
public typealias MLNKeychainStorable = MLNKeychainLoadable & MLNKeychainRemovable & MLNKeychainReplaceable & MLNKeychainSaveable
