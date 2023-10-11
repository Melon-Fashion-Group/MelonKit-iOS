// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.


//
//  Package.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import PackageDescription



// MARK: - Swift Package

let package = Package(
    name: "Melon Fashion",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "MelonKit",
            targets: ["MelonKit"]
        )
    ],
    targets: [
        .target(name: "MelonKit")
    ]
)
