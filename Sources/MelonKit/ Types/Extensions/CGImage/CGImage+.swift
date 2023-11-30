//
//  CGImage+.swift
//  MelonKit
//
//  Created by Dimka Novikov on 29.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import CoreGraphics



// MARK: - CGImage Darkness Detection

extension CGImage {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public var isDark: Bool {
        guard
            let data = self.dataProvider?.data,
            let pointer = CFDataGetBytePtr(data)
        else {
            return false
        }

        let length = CFDataGetLength(data)

        let threshold = Int(Double(self.width * self.height) * 0.45)

        var darkPixels = 0

        for index in stride(from: 0, to: length, by: 4) {
            let red = pointer[index]
            let green = pointer[index + 1]
            let blue = pointer[index + 2]

            let luminance = (Double(red) * 0.299) + (Double(green) * 0.585) + (Double(blue) * 0.114)

            if luminance < 150 {
                darkPixels += 1

                if darkPixels > threshold {
                    return true
                }
            }
        }

        return false
    }
}
