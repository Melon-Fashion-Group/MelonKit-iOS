//
//  DefaultStorage.swift
//  MelonKit
//
//  Created by Dimka Novikov on 07.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - DefaultStorage

@available(iOS 15.0, *)
final class DefaultStorage {

    // MARK: - Private properties

    private let userDefaults = UserDefaults.standard
}



// MARK: - MLNDataSaveable

extension DefaultStorage: MLNDataSaveable {

    // MARK: - Public methods

    @discardableResult
    func save<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        guard let data = try? JSONEncoder().encode(object) else {
            return false
        }

        userDefaults.set(data, forKey: key)

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

extension DefaultStorage: MLNDataReplaceable {

    // MARK: - Public methods

    func replace<Object: MLNDataEncodable>(_ object: Object, forKey key: String) -> Bool {
        save(object, forKey: key)
    }

    func replace<Object: MLNDataEncodable>(_ objects: [Object], forKeys keys: [String]) -> Bool {
        save(objects, forKeys: keys)
    }
}



// MARK: - MLNDataLoadable

extension DefaultStorage: MLNDataLoadable {

    // MARK: - Public methods

    func load<Object: MLNDataDecodable>(_ object: inout Object, forKey key: String) -> Bool {
        guard
            let encoded = userDefaults.object(forKey: key) as? Data,
            let data = try? JSONDecoder().decode(Object.self, from: encoded)
        else {
            return false
        }

        object = data

        return true
    }

    func load<Object: MLNDataDecodable>(_ objects: inout [Object], forKeys keys: [String]) -> Bool {
        var newObjects: [Object] = []

        keys.forEach { key in
            guard
                let encoded = userDefaults.object(forKey: key) as? Data,
                let data = try? JSONDecoder().decode(Object.self, from: encoded)
            else { return }

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

extension DefaultStorage: MLNDataRemovable {

    // MARK: - Public methods
    
    @discardableResult
    func remove(forKey key: String) -> Bool {
        userDefaults.removeObject(forKey: key)

        return true
    }

    func remove(forKeys keys: [String]) -> Bool {
        keys.forEach { key in
            remove(forKey: key)
        }

        return true
    }

    func removeAll() -> Bool {
        guard let domain = Bundle.main.bundleIdentifier else {
            return false
        }

        userDefaults.removePersistentDomain(forName: domain)

        userDefaults.synchronize()

        return true
    }
}
