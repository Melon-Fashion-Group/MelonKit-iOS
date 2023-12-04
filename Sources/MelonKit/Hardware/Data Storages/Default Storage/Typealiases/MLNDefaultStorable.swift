//
//  MLNDefaultStorable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultStorable

///
///
///
@available(iOS 15.0, *)
public typealias MLNDefaultStorable = MLNDefaultLoadable & MLNDefaultRemovable & MLNDefaultReplaceable & MLNDefaultSaveable
