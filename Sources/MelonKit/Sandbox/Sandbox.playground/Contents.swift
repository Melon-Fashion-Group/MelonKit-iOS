//
//  Sandbox.playground
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


/*
 *  This is a place to test hypotheses, implement test services and framework functionality
 *  to test its operation with their long-term implementation of *.swift files.
 */


// MARK: Import section

import Foundation



// MARK: - Helpers

@available(iOS 15.0, *)
public typealias MLNObject = AnyObject & CustomStringConvertible

@available(iOS 15.0, *)
public protocol MLNServiceable: MLNObject { }

extension MLNServiceable {
    public var description: String {
        "This class supports Dependency Injection and can be registered via MLNServiceContainer"
    }
}



// MARK: - Implementable Service

@available(iOS 15.0, *)
public protocol MLNCachingLoadable: MLNServiceable {
    func load<Cache: MLNCachingDecodable>(_ type: Cache.Type, forKey key: String) -> Cache?
    func load<Cache: MLNCachingDecodable>(_ type: Cache.Type, forKeys keys: [String]) -> [Cache]?
}

@available(iOS 15.0, *)
public protocol MLNCachingRemovable: MLNServiceable {
    func remove(forKey key: String) -> Bool
    func remove(forKeys keys: [String]) -> Bool
    func removeAll() -> Bool
}

@available(iOS 15.0, *)
public protocol MLNCachingReplaceable: MLNServiceable {
    func replace<Cache: MLNCachingEncodable>(_ cache: Cache, forKey key: String) -> Bool
    func replace<Cache: MLNCachingEncodable>(_ caches: [Cache], forKeys keys: [String]) -> Bool
}

@available(iOS 15.0, *)
public protocol MLNCachingSaveable: MLNServiceable {
    func save<Cache: MLNCachingEncodable>(_ cache: Cache, forKey key: String) -> Bool
    func save<Cache: MLNCachingEncodable>(_ caches: [Cache], forKeys keys: [String]) -> Bool
}

// MARK: - Caching Codables

@available(iOS 15.0, *)
public typealias MLNCachingDecodable = Decodable

@available(iOS 15.0, *)
public typealias MLNCachingEncodable = Encodable

@available(iOS 15.0, *)
public typealias MLNCachingStorable = MLNCachingLoadable & MLNCachingRemovable & MLNCachingReplaceable & MLNCachingSaveable

@available(iOS 15.0, *)
public final class MLNCachingStorage: MLNServiceable {
    private let cache = NSCache<NSString, AnyObject>()

    public init(
        objectsCount: Int = 0,
        cacheSize: Int = 0
    ) {
        cache.countLimit = objectsCount
        cache.totalCostLimit = cacheSize
    }
}

extension MLNCachingStorage: MLNCachingLoadable {
    @discardableResult
    public func load<Cache: MLNCachingDecodable>(_ cache: inout Cache, forKey key: String) -> Bool {
        guard let loadedCache = self.cache.object(forKey: .init(string: key)) as? Cache else {
            return false
        }

        cache = loadedCache

        return true
    }

    @discardableResult
    public func load<Cache: MLNCachingDecodable>(_ caches: inout [Cache], forKeys keys: [String]) -> Bool {
        var loadedCaches: [Cache] = []

        keys.forEach { key in
            guard let loadedCache = cache.object(forKey: .init(string: key)) as? Cache else { return }

            loadedCaches.append(loadedCache)
        }

        guard loadedCaches.count == keys.count else {
            return false
        }

        caches = loadedCaches

        return true
    }
}

extension MLNCachingStorage: MLNCachingRemovable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func remove(forKey key: String) -> Bool {
        cache.removeObject(forKey: .init(string: key))

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func remove(forKeys keys: [String]) -> Bool {
        var removedCachesCount = keys.count

        keys.forEach { key in
            if remove(forKey: key) {
                removedCachesCount -= 1
            }
        }

        guard removedCachesCount == 0 else {
            return false
        }

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func removeAll() -> Bool {
        cache.removeAllObjects()

        return true
    }
}



// MARK: - MLNCachingReplaceable

extension MLNCachingStorage: MLNCachingReplaceable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func replace<Cache: MLNCachingEncodable>(_ cache: Cache, forKey key: String) -> Bool {
        save(cache, forKey: key)
    }

    ///
    ///
    ///
    @discardableResult
    public func replace<Cache: MLNCachingEncodable>(_ caches: [Cache], forKeys keys: [String]) -> Bool {
        save(caches, forKeys: keys)
    }
}



// MARK: - MLNCachingSaveable

extension MLNCachingStorage: MLNCachingSaveable {

    // MARK: - Public methods

    ///
    ///
    ///
    @discardableResult
    public func save<Cache: MLNCachingEncodable>(_ cache: Cache, forKey key: String) -> Bool {
        self.cache.setObject(cache, forKey: .init(string: key))

        return true
    }

    ///
    ///
    ///
    @discardableResult
    public func save<Cache: MLNCachingEncodable>(_ caches: [Cache], forKeys keys: [String]) -> Bool {
        guard caches.count == keys.count else {
            return false
        }

        var savedCachesCount = 0

        caches.enumerated().forEach { (index, cache) in
            if save(cache, forKey: keys[index]) {
                savedCachesCount += 1
            }
        }

        guard savedCachesCount == caches.count else {
            return false
        }

        return true
    }
}










// TODO: - Create -

// 1. IoC -> DI ✅
// 2. Navigation ❌ -> Coordinator ❌ / Deeplink Manager ❌
// 3. Push Notifications ❌ -> Local Push Notification ❌ / Remote Push Notification ❌
// 5. Device Specification ❌
// 6. Live Preview ❌
// 7. Logger ❌
// 8. Project Specifications ❌ -> App Specification ❌ / Framework Specification ❌
// 9. Data Storage ❌ -> Caching Storage ⚠️ / Default Storage ❌ / File Storage / Keychain Storage ❌
// 10. Haptic Feedbacks ✅ -> Haptic Feedback ✅
// 11. Media Engines ❌ -> Video Engine ❌
// 12. Network Interaction ⚠️ -> Network Configuration ✅ / Network Manager ❌
// 13. Setting up MelonKit repo
