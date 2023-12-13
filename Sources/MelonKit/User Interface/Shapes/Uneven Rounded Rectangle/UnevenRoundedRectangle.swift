//
//  UnevenRoundedRectangle.swift
//  MelonKit
//
//  Created by Dimka Novikov on 05.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - UnevenRoundedRectangle

///
///
///
public struct UnevenRoundedRectangle: Shape {

    // MARK: - Private properties

    private let radius: CGFloat

    private let corners: UIRectCorner



    // MARK: - Init

    ///
    ///
    ///
    public init(
        radius: CGFloat = .infinity,
        corners: UIRectCorner = .allCorners
    ) {
        self.radius = radius
        self.corners = corners
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: .init(width: radius, height: radius)
        )

        return .init(bezierPath.cgPath)
    }
}
