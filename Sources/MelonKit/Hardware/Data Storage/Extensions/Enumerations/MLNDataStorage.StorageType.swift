//
//  MLNDataStorage.StorageType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataStorage.StorageType

extension MLNDataStorage {

    // MARK: - Public enumerations

    ///
    ///
    ///
    public enum StorageType {

        ///
        ///
        ///
        case caching(objectsCount: Int = .max, cacheSize: Int = .max)

        ///
        ///
        ///
//        case database

        ///
        ///
        ///
        case `default`

        ///
        ///
        ///
//        case file

        ///
        ///
        ///
//        case keychain
    }
}
