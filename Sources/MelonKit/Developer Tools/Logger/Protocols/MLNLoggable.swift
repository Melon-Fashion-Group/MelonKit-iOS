//
//  MLNLoggable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNLoggable

///
///
///
@available(iOS 15.0, *)
public protocol MLNLoggable: MLNServiceable {

    // MARK: - Public methods

    ///
    ///
    ///
    func log(type: MLNLogger.LogType, file: String, line: UInt16, _ log: () -> MLNLogger.Log)
}
