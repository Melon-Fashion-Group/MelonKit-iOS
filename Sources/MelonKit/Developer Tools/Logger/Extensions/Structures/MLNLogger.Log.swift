//
//  MLNLogger.Log.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNLogger.Log

extension MLNLogger {

    // MARK: - Public structures

    ///
    ///
    ///
    public struct Log {
        let message: String
        let description: String?

        ///
        ///
        ///
        public init(
            message: String,
            description: String? = nil
        ) {
            self.message = message
            self.description = description
        }
    }
}
