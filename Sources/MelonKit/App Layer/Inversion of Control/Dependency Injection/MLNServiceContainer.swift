//
//  MLNServiceContainer.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNServiceContainer

///
///
///
@available(iOS 15.0, *)
public final class MLNServiceContainer: MLNServiceContainerable {

    // MARK: - Static properties

    private static var factories: [String: () -> Any] = [:]

    private static var cache: [String: Any] = [:]



    // MARK: - Public methods

    ///
    ///
    ///
    public static func register<Service: MLNServiceable>(
        type: Service.Type,
        _ factory: @autoclosure @escaping () -> Service
    ) {
        factories[.init(describing: type.self)] = factory
    }

    ///
    ///
    ///
    public static func resolve<Service: MLNServiceable>(
        _ resolveType: MLNServiceType,
        _ type: Service.Type
    ) -> Service? {
        let serviceName = String(describing: type.self)

        switch resolveType {
        case .new:
            return factories[serviceName]?() as? Service
        case .singleton(let instance):
            switch instance {
            case .new:
                return getService(name: serviceName) as? Service
            case .same:
                guard let service = cache[serviceName] as? Service else {
                    return getService(name: serviceName) as? Service
                }

                return service
            }
        }
    }



    // MARK: - Private functions

    private static func getService(name: String) -> (any MLNServiceable)? {
        let service = factories[name]?() as? MLNServiceable

        if let service {
            cache[name] = service
        }

        return service
    }
}
