//
//  MLNService.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNService

///
///
///
@available(iOS 15.0, *)
@propertyWrapper
public struct MLNService<Service: MLNServiceable> {

    // MARK: - Public properties

    ///
    ///
    ///
    public var wrappedValue: Service {
        get { service }
        set { service = newValue }
    }



    // MARK: - Private properties

    private var service: Service



    // MARK: - Init

    ///
    ///
    ///
    public init(_ type: MLNServiceType = .new) {
        guard let service = MLNServiceContainer.resolve(type, Service.self) else {
            let serviceName = String(describing: Service.self)

            fatalError("No service of type \(serviceName) registered.")
        }

        self.service = service
    }
}
