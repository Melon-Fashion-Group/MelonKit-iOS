//
//  MLNHaptic.FeedbackIntensity.swift
//  MelonKit
//
//  Created by Dimka Novikov on 30.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNHaptic.FeedbackIntensity

extension MLNHaptic {

    ///
    /// An enumeration that describes a list of feedback intensities.
    ///
    public enum FeedbackIntensity: CGFloat {

        ///
        ///
        ///
        case weak = 0.2

        ///
        ///
        ///
        case low = 0.4

        ///
        ///
        ///
        case medium = 0.6

        ///
        ///
        ///
        case high = 0.8

        ///
        ///
        ///
        case strong = 1
    }
}
