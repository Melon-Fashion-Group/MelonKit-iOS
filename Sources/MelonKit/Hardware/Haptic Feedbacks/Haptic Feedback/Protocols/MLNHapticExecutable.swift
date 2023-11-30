//
//  MLNHapticExecutable.swift
//  MelonKit
//
//  Created by Dimka Novikov on 30.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import Foundation



// MARK: - MLNHapticExecutable

///
/// A protocol that describes the operation of  Haptic Feedback.
///
@available(iOS 16.0, *)
public protocol MLNHapticExecutable: MLNServiceable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNHapticExecutable protocol.
    ///
    static var feedback: MLNHapticExecutable { get }



    // MARK: - Public methods

    ///
    /// A method that implements haptic feedback with a given feedback type.
    ///
    /// Allows you to use the  Taptic Engine without using wrappers to reconciliate the device type, and also supports multithreading by default.
    ///
    /// To implement taptic feedback, it is enough to refer to the `execute(with: MLNHaptic.FeedbackType)` method.
    ///
    /// Example:
    ///
    ///     MLNHaptic.feedback.execute(with: .success)
    ///
    /// - Parameters:
    ///    - feedbackType: Enumeration of the types of possible haptic feedback.
    ///
    /// - Authors: Dmitry Novikov · Melon Fashion Group
    ///
    /// - Bug: None
    ///
    func execute(with feedbackType: MLNHaptic.FeedbackType)
}
