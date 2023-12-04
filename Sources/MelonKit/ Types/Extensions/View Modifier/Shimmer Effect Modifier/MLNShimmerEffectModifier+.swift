//
//  MLNShimmerEffectModifier.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - Configuration

extension MLNShimmerEffectModifier {

    // MARK: - Public structure

    ///
    ///
    ///
    @available(iOS 15.0, *)
    public struct Configuration {

        // MARK: - Public properties

        let tintColor: Color

        let highlightColor: Color

        let highlightOpacity: CGFloat

        let blurRadius: CGFloat

        let duration: CGFloat



        // MARK: - Init

        ///
        ///
        ///
        public init(
            tintColor: Color,
            highlightColor: Color,
            highlightOpacity: CGFloat = 1,
            blurRadius: CGFloat = 0,
            duration: CGFloat = 2
        ) {
            self.tintColor = tintColor
            self.highlightColor = highlightColor
            self.highlightOpacity = highlightOpacity
            self.blurRadius = blurRadius
            self.duration = duration
        }
    }
}
