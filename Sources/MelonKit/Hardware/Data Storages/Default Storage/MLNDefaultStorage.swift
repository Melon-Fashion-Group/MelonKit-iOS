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
    public func load<Object: MLNDefaultDecodable>(_ type: Object.Type, forKey key: String) -> Object? {
        guard
            let object = userDefaults.object(forKey: key) as? Data,
            let loadedObject = try? JSONDecoder().decode(type, from: object)
        else {
            return nil
        }

        return loadedObject
    }

    ///
    ///
    ///
    public func load<Object: MLNDefaultDecodable>(_ type: Object.Type, forKeys keys: [String]) -> [Object]? {
        var loadedObjects: [Object] = []

        keys.forEach { key in
            guard let loadedObject = load(type, forKey: key) else { return }

            loadedObjects.append(loadedObject)
        }

        guard loadedObjects.count == keys.count else {
            return nil
        }

        return loadedObjects
    }
}



// MARK: - MLNDefaultRemovable

extension MLNDefaultStorage: MLNDefaultRemovable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func remove(forKey key: String) -> Bool {
        userDefaults.removeObject(forKey: key)

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func remove(forKeys keys: [String]) -> Bool {
        var removedObjectsCount = keys.count

        keys.forEach { key in
            if remove(forKey: key) {
                removedObjectsCount -= 1
            }
        }

        guard removedObjectsCount == 0 else {
            return false
        }

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func removeAll() -> Bool {
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
    public func replace<Object: MLNDefaultEncodable>(_ object: Object, forKey key: String) -> Bool {
        save(object, forKey: key)
    }

    ///
    ///
    ///
    @discardableResult
    public func replace<Object: MLNDefaultEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        save(objects, forKeys: keys)
    }
}



// MARK: - MLNDefaultSaveable

extension MLNDefaultStorage: MLNDefaultSaveable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func save<Object: MLNDefaultEncodable>(_ object: Object, forKey key: String) -> Bool {
        guard let data = try? JSONEncoder().encode(object) else {
            return false
        }

        userDefaults.set(data, forKey: key)

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func save<Object: MLNDefaultEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        guard objects.count == keys.count else {
            return false
        }

        var savedObjectsCount = 0

        objects.enumerated().forEach { (index, object) in
            if save(object, forKey: keys[index]) {
                savedObjectsCount += 1
            }
        }

        guard savedObjectsCount == objects.count else {
            return false
        }

        return true
    }
}
