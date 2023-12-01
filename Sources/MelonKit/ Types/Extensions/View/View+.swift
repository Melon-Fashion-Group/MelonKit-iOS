//
//  View+.swift
//  MelonKit
//
//  Created by Dimka Novikov on 29.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - Execute New Task

extension View {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public func executeNewTask(
        delay: Float = 0,
        body: (() -> Void)? = nil,
        completion: () -> Void
    ) async {
        try? await Task.sleep(nanoseconds: .init(delay * 1_000_000_000))

        body?()

        await MainActor.run {
            completion()
        }
    }
}



// MARK: -  Render the View into an Image

extension View {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    @MainActor
    public func renderImage(from view: some View) -> UIImage? {
        let renderer = ImageRenderer(content: view)

        return renderer.uiImage
    }
}



// MARK: - View Darkness Detection

extension View {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public func detectDarkness(in view: some View) async -> Bool {
        guard let image = await renderImage(from: view) else {
            return false
        }

        return image.isDark
    }
}



// MARK: - Shimmer Effect

extension View {

    ///
    ///
    ///
    @available(iOS 16.0, *)
    @ViewBuilder
    public func shimmerEffect(configuration: MLNShimmerEffectModifier.Configuration) -> some View {
        self.modifier(MLNShimmerEffectModifier(configuration: configuration))
    }
}
