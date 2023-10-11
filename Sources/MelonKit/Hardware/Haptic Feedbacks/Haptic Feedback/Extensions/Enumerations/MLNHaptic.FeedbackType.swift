//
//  MLNHaptic.FeedbackType.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNHaptic.FeedbackType

extension MLNHaptic {

    ///
    /// An enumeration that describes a list of feedback types.
    ///
    public enum FeedbackType {

        ///
        ///
        ///
        case error

        ///
        ///
        ///
        case warning

        ///
        ///
        ///
        case success

        ///
        ///
        ///
        case soft(intensity: FeedbackIntensity)

        ///
        ///
        ///
        case light(intensity: FeedbackIntensity)

        ///
        ///
        ///
        case medium(intensity: FeedbackIntensity)

        ///
        ///
        ///
        case heavy(intensity: FeedbackIntensity)

        ///
        ///
        ///
        case rigid(intensity: FeedbackIntensity)

        ///
        ///
        ///
        case selection
    }
}
