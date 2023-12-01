//
//  TabView+.swift
//  MelonKit
//
//  Created by Dimka Novikov on 30.11.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//
//


// MARK: Import section

import SwiftUI



// MARK: - Setup Tab View Style

extension TabView {

    // MARK: - Public methods

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public func setupTabViewStyle(
        colors: Colors,
        titleFont: UIFont,
        badgeFont: UIFont
    ) -> TabView {
        let newAppearance = UITabBarAppearance()

        newAppearance.backgroundColor = .init(colors.background)
        newAppearance.shadowColor = .init(colors.shadow)
        newAppearance.backgroundImage = .init()

        let newItemAppearance = UITabBarItemAppearance()

        newItemAppearance.normal.iconColor = .init(colors.normal)
        newItemAppearance.selected.iconColor = .init(colors.selected)

        newItemAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor(colors.normal),
            .font: titleFont
        ]
        newItemAppearance.selected.titleTextAttributes = [
            .foregroundColor: UIColor(colors.selected),
            .font: titleFont
        ]

        newItemAppearance.normal.badgeBackgroundColor = .init(colors.selected)
        newItemAppearance.selected.badgeBackgroundColor = .init(colors.selected)

        newItemAppearance.normal.badgeTitlePositionAdjustment = .init(horizontal: 0.2, vertical: 0.5)
        newItemAppearance.selected.badgeTitlePositionAdjustment = .init(horizontal: 0.2, vertical: 0.5)

        newItemAppearance.normal.badgeTextAttributes = [
            .foregroundColor: UIColor(colors.background),
            .font: badgeFont
        ]
        newItemAppearance.selected.badgeTextAttributes = [
            .foregroundColor: UIColor(colors.background),
            .font: badgeFont
        ]

        newAppearance.inlineLayoutAppearance = newItemAppearance
        newAppearance.stackedLayoutAppearance = newItemAppearance
        newAppearance.compactInlineLayoutAppearance = newItemAppearance

        UITabBar.appearance().standardAppearance = newAppearance
        UITabBar.appearance().isTranslucent = false

        return self
    }
}



// MARK: - Colors

extension TabView {

    // MARK: - Public structure

    ///
    ///
    ///
    @available(iOS 16.0, *)
    public struct Colors {

        // MARK: - Public properties

        let background: Color

        let shadow: Color

        let normal: Color

        let selected: Color



        // MARK: - Init

        ///
        ///
        ///
        public init(
            background: Color,
            shadow: Color,
            normal: Color,
            selected: Color
        ) {
            self.background = background
            self.shadow = shadow
            self.normal = normal
            self.selected = selected
        }
    }
}
