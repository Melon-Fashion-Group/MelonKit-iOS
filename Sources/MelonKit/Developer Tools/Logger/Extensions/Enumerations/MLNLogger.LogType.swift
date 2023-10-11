//
//  MLNLogger.LogType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNLogger.LogType

extension MLNLogger {

    // MARK: - Public enumerations

    ///
    ///
    ///
    public enum LogType: String {

        ///
        ///
        ///
        case debug

        ///
        ///
        ///
        case error

        ///
        ///
        ///
        case info

        ///
        ///
        ///
        case warning

        ///
        ///
        ///
        case trace

        ///
        ///
        ///
        case notice

        ///
        ///
        ///
        case critical

        ///
        ///
        ///
        case fault
    }
}
