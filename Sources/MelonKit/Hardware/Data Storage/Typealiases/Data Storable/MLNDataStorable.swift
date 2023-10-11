//
//  MLNDataStorable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataStorable

///
///
///
@available(iOS 15.0, *)
public typealias MLNDataStorable = MLNDataSaveable & MLNDataReplaceable & MLNDataLoadable & MLNDataRemovable
