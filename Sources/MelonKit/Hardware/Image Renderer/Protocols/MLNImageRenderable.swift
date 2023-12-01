//
//  MLNImageRenderable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - MLNImageRenderable

///
///
///
@available(iOS 16.0, *)
public protocol MLNImageRenderable: AnyObject {

    // MARK: - Public methods

    ///
    ///
    ///
    func render() -> UIImage?
}
