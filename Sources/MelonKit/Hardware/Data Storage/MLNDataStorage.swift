//
//  MLNDataStorage.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNDataStorage

///
///
///
@available(iOS 15.0, *)
public final class MLNDataStorage {

    // MARK: - Private properties

    private let storage: MLNDataStorable



    // MARK: - Init

    ///
    ///
    ///
    public init(with storageType: StorageType = .default) {
        switch storageType {
        case .caching(let objectsCount, let cacheSize):
            storage = CachingStorage(objectsCount: objectsCount, cacheSize: cacheSize)
        case .default:
            storage = DefaultStorage()
        }
    }
}



// MARK: - MLNDataSaveable

extension MLNDataStorage: MLNDataSaveable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func save<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        storage.save(object, forKey: key)
    }

    ///
    ///
    ///
    @discardableResult
    public func save<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        guard objects.count == keys.count else {
            return false
        }

        return storage.save(objects, forKeys: keys)
    }
}



// MARK: - MLNDataReplaceable

extension MLNDataStorage: MLNDataReplaceable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func replace<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        storage.replace(object, forKey: key)
    }

    @discardableResult
    public func replace<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        guard objects.count == keys.count else {
            return false
        }

        return storage.replace(objects, forKeys: keys)
    }
}



// MARK: - MLNDataLoadable

extension MLNDataStorage: MLNDataLoadable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func load<Object: MLNDataDecodable>(_ object: inout Object, forKey key: String) -> Bool {
        storage.load(&object, forKey: key)
    }

    ///
    ///
    ///
    @discardableResult
    public func load<Object: MLNDataDecodable>(_ objects: inout [Object], forKeys keys: [String]) -> Bool {
        guard objects.count == keys.count else {
            return false
        }

        return storage.load(&objects, forKeys: keys)
    }
}



// MARK: - MLNDataRemovable

extension MLNDataStorage: MLNDataRemovable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func remove(forKey key: String) -> Bool {
        storage.remove(forKey: key)
    }

    ///
    ///
    ///
    @discardableResult
    public func remove(forKeys keys: [String]) -> Bool {
        storage.remove(forKeys: keys)
    }

    ///
    ///
    ///
    @discardableResult
    public func removeAll() -> Bool {
        storage.removeAll()
    }
}
