//
//  MLNHaptic.swift
//  MelonKit
//
//  Created by Dimka Novikov on 30.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit
import AudioToolbox.AudioServices



// MARK: - MLNHaptic

///
/// A class that implements the operation of  Haptic Feedback.
///
@available(iOS 15.0, *)
public final class MLNHaptic: MLNHapticExecutable {

    // MARK: - Static properties

    ///
    /// A shared property that allows access to the properties of a class that implements the MLNHapticExecutable protocol.
    ///
    public static let feedback: MLNHapticExecutable = MLNHaptic()



    // MARK: - Init

    private init() { }



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
    public func execute(with feedbackType: FeedbackType) {
        switch feedbackType {
        case .error:
            let tapticEngine = UINotificationFeedbackGenerator()
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.notificationOccurred(.error)
            }
        case .warning:
            let tapticEngine = UINotificationFeedbackGenerator()
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.notificationOccurred(.warning)
            }
        case .success:
            let tapticEngine = UINotificationFeedbackGenerator()
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.notificationOccurred(.success)
            }
        case .soft(let intensity):
            let tapticEngine = UIImpactFeedbackGenerator(style: .soft)
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.impactOccurred(intensity: intensity.rawValue)
            }
        case .light(let intensity):
            let tapticEngine = UIImpactFeedbackGenerator(style: .light)
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.impactOccurred(intensity: intensity.rawValue)
            }
        case .medium(let intensity):
            let tapticEngine = UIImpactFeedbackGenerator(style: .medium)
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.impactOccurred(intensity: intensity.rawValue)
            }
        case .heavy(let intensity):
            let tapticEngine = UIImpactFeedbackGenerator(style: .heavy)
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.impactOccurred(intensity: intensity.rawValue)
            }
        case .rigid(let intensity):
            let tapticEngine = UIImpactFeedbackGenerator(style: .rigid)
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.impactOccurred(intensity: intensity.rawValue)
            }
        case .selection:
            let tapticEngine = UISelectionFeedbackGenerator()
            tapticEngine.prepare()

            Task(priority: .userInitiated) {
                await tapticEngine.selectionChanged()
            }
        }
    }
}
