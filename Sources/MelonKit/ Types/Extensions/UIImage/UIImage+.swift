//
//  UIImage+.swift
//  MelonKit
//
//  Created by Dimka Novikov on 29.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - UIImage Darkness Detection

extension UIImage {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public func isDark() async -> Bool {
        await self.cgImage?.isDark() ?? false
    }
}
