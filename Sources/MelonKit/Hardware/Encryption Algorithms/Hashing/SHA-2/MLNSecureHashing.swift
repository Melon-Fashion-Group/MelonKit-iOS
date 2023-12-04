//
//  MLNSecureHashing.swift
//  MelonKit
//
//  Created by Dimka Novikov on 04.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import CryptoKit
import Foundation



// MARK: - MLNSecureHashing

///
///
///
@available(iOS 15.0, *)
public final class MLNSecureHashing: MLNSecureHashable {

    // MARK: - Private properties

    private let hashValue: HashValue



    // MARK: - Init

    ///
    ///
    ///
    public init(hashValue: HashValue) {
        self.hashValue = hashValue
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func hash(_ string: String, using encoding: String.Encoding) -> String? {
        guard let data = string.data(using: encoding) else {
            return nil
        }

        switch hashValue {
        case .bits256:
            return SHA256
                .hash(data: data)
                .compactMap { .init(format: "%02x", $0) }
                .joined()
        case .bits384:
            return SHA384
                .hash(data: data)
                .compactMap { .init(format: "%02x", $0) }
                .joined()
        case .bits512:
            return SHA512
                .hash(data: data)
                .compactMap { .init(format: "%02x", $0) }
                .joined()
        }
    }
}
