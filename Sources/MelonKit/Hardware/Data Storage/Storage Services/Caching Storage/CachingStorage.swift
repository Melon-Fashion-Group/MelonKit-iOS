//
//  CachingStorage.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - CachingStorage

@available(iOS 15.0, *)
final class CachingStorage {

    // MARK: - Private properties

    private let cache = NSCache<NSString, AnyObject>()



    // MARK: - Init

    init(objectsCount: Int, cacheSize: Int) {
        cache.countLimit = objectsCount
        cache.totalCostLimit = cacheSize
    }
}



// MARK: - MLNDataSaveable

extension CachingStorage: MLNDataSaveable {

    // MARK: - Public methods

    @discardableResult
    func save<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        cache.setObject(object, forKey: .init(string: key))

        return true
    }

    func save<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        objects.enumerated().forEach { (index, object) in
            save(object, forKey: keys[index])
        }

        return true
    }
}



// MARK: - MLNDataReplaceable
extension CachingStorage: MLNDataReplaceable {

    // MARK: - Public methods

    func replace<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        save(object, forKey: key)
    }

    func replace<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        save(objects, forKeys: keys)
    }
}



// MARK: - MLNDataLoadable

extension CachingStorage: MLNDataLoadable {

    // MARK: - Public methods

    func load<Object: MLNDataDecodable>(_ object: inout Object, forKey key: String) -> Bool {
        guard let data = cache.object(forKey: .init(string: key)) as? Object else {
            return false
        }

        object = data

        return true
    }

    func load<Object: MLNDataDecodable>(_ objects: inout [Object], forKeys keys: [String]) -> Bool {
        var newObjects: [Object] = []

        keys.forEach { key in
            guard let data = cache.object(forKey: .init(string: key)) as? Object else { return }

            newObjects.append(data)
        }

        guard newObjects.count == keys.count else {
            return false
        }

        objects = newObjects

        return true
    }
}



// MARK: - MLNDataRemovable

extension CachingStorage: MLNDataRemovable {

    // MARK: - Public methods

    @discardableResult
    func remove(forKey key: String) -> Bool {
        cache.removeObject(forKey: .init(string: key))

        return true
    }

    func remove(forKeys keys: [String]) -> Bool {
        keys.forEach { key in
            remove(forKey: key)
        }

        return true
    }

    func removeAll() -> Bool {
        cache.removeAllObjects()

        return true
    }
}
