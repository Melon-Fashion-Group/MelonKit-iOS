//
//  MLNLivePreview.swift
//  MelonKit
//
//  Created by Dimka Novikov on 06.10.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - UIViewController+

extension UIViewController {

    // MARK: - Private structures

    @available(iOS 15.0, *)
    private struct MLNLivePreview: UIViewControllerRepresentable {
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> some UIViewController { viewController }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) { }
    }



    // MARK: - Public methods

    ///
    /// A method that represents a subclass of UIViewController into a view supported by SwiftUI Canvas that implements the View protocol.
    ///
    /// Example:
    ///
    ///     #Preview(String(describing: CustomViewController.self)) {
    ///         CustomViewController()
    ///             .livePreview()
    ///     }
    ///
    /// - Authors: Dmitry Novikov · Melon Fashion Group
    ///
    /// - Bug: None
    ///
    /// - Returns: A view supported by SwiftUI Canvas that implements the View protocol.
    ///
    @available(iOS 15.0, *)
    public func livePreview() -> some View {
        MLNLivePreview(viewController: self)
    }
}



// MARK: - UIView+

extension UIView {

    // MARK: - Private structures

    @available(iOS 15.0, *)
    private struct MLNLivePreview: UIViewRepresentable {
        let view: UIView

        func makeUIView(context: Context) -> some UIView { view }

        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }



    // MARK: - Public methods

    ///
    /// A method that represents a subclass of UIView into a view supported by SwiftUI Canvas that implements the View protocol.
    ///
    /// Example:
    ///
    ///     #Preview(String(describing: CustomView.self)) {
    ///         CustomView()
    ///             .livePreview()
    ///     }
    ///
    /// - Authors: Dmitry Novikov · Melon Fashion Group
    ///
    /// - Bug: None
    ///
    /// - Returns: A view supported by SwiftUI Canvas that implements the View protocol.
    ///
    @available(iOS 15.0, *)
    public func livePreview() -> some View {
        MLNLivePreview(view: self)
    }
}

