//
//  MLNShimmerEffectModifier.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNShimmerEffectModifier

///
///
///
@available(iOS 15.0, *)
public struct MLNShimmerEffectModifier: ViewModifier {

    // MARK: - Private properties

    private let tintColor: Color

    private let highlightColor: Color

    private let highlightOpacity: CGFloat

    private let blurRadius: CGFloat

    private let duration: CGFloat

    @State private var startPoint: CGFloat = -1



    // MARK: - Init

    ///
    ///
    ///
    public init(configuration: Configuration) {
        self.tintColor = configuration.tintColor
        self.highlightColor = configuration.highlightColor
        self.highlightOpacity = configuration.highlightOpacity
        self.blurRadius = configuration.blurRadius
        self.duration = configuration.duration
    }



    // MARK: - Body

    ///
    ///
    ///
    public func body(content: Content) -> some View {
        content
            .hidden()
            .overlay {
                Rectangle()
                    .fill(tintColor)
                    .mask {
                        content
                    }
                    .overlay {
                        GeometryReader { proxy in
                            let offset = proxy.size.height / 2

                            Rectangle()
                                .fill(highlightColor)
                                .mask {
                                    Rectangle()
                                        .fill(
                                            .linearGradient(
                                                colors: [
                                                    highlightColor.opacity(0),
                                                    highlightColor.opacity(highlightOpacity),
                                                    highlightColor.opacity(0)
                                                ],
                                                startPoint: .leading,
                                                endPoint: .trailing
                                            )
                                        )
                                        .blur(radius: blurRadius)
                                        .offset(x: startPoint > 0 ? offset : -offset)
                                        .offset(x: proxy.size.width * startPoint)
                                }
                        }
                        .mask {
                            content
                        }
                    }
            }
            .onAppear {
                startPoint = -startPoint
            }
            .animation(
                .linear(duration: duration)
                .repeatForever(autoreverses: false),
                value: startPoint
            )
    }
}
