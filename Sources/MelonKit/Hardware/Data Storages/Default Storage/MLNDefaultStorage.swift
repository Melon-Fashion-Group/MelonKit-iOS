//
//  MLNDefaultStorage.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDefaultStorage

///
///
///
@available(iOS 15.0, *)
public final class MLNDefaultStorage: MLNServiceable {

    // MARK: - Private properties

    private let userDefaults = UserDefaults.standard



    // MARK: - Init

    ///
    ///
    ///
    public init() { }
}



// MARK: - MLNDefaultLoadable

extension MLNDefaultStorage: MLNDefaultLoadable {

    // MARK: - Public methods

    ///
    ///
    ///
    public func load<Object: MLNDataDecodable>(_ type: Object.Type, forKey key: String) async -> Object? {
        guard
            let object = userDefaults.object(forKey: key) as? Data,
            let loadedObject = try? JSONDecoder().decode(type, from: object)
        else {
            return nil
        }

        return loadedObject
    }
}



// MARK: - MLNDefaultRemovable

extension MLNDefaultStorage: MLNDefaultRemovable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func remove(forKey key: String) async -> Bool {
        userDefaults.removeObject(forKey: key)

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func removeAll() async -> Bool {
        guard let bundleID = Bundle.main.bundleIdentifier else {
            return false
        }

        userDefaults.removePersistentDomain(forName: bundleID)

        userDefaults.synchronize()

        return true
    }
}



// MARK: - MLNDefaultReplaceable

extension MLNDefaultStorage: MLNDefaultReplaceable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func replace<Object: MLNDataEncodable>(_ object: Object, forKey key: String) async -> Bool {
        await save(object, forKey: key)
    }
}



// MARK: - MLNDefaultSaveable

extension MLNDefaultStorage: MLNDefaultSaveable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func save<Object: MLNDataEncodable>(_ object: Object, forKey key: String) async -> Bool {
        guard let data = try? JSONEncoder().encode(object) else {
            return false
        }

        userDefaults.set(data, forKey: key)

        return true
    }
}
