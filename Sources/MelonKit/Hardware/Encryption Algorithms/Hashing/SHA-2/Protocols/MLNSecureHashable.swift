//
//  MLNSecureHashable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 04.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNSecureHashable

///
///
///
@available(iOS 15.0, *)
public protocol MLNSecureHashable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func hash(_ string: String, using encoding: String.Encoding) -> String?
}
