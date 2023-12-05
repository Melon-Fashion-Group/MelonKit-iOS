//
//  MLNKeychainStorage+.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//



// MARK: Import section

import Foundation



// MARK: - CloudSaving

extension MLNKeychainStorage {

    // MARK: - Public enumeration

    ///
    ///
    ///
    public enum CloudSaving {

        ///
        ///
        ///
        case disable

        ///
        ///
        ///
        case enable(accessGroup: String)
    }
}
