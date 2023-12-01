//
//  MLNImageRendererView.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import SwiftUI



// MARK: - MLNImageRendererView

///
///
///
@available(iOS 16.0, *)
public struct MLNImageRendererView: UIViewRepresentable {

    // MARK: - Private properties

    private let closure: (MLNImageRenderable) -> Void



    // MARK: - Init

    ///
    ///
    ///
    public init(_ closure: @escaping (MLNImageRenderable) -> Void) {
        self.closure = closure
    }



    // MARK: - Public methods

    ///
    ///
    ///
    public func makeUIView(context: Context) -> MLNImageRendererUIView {
        .init(frame: CGRect.zero)
    }

    ///
    ///
    ///
    public func updateUIView(_ uiView: MLNImageRendererUIView, context: Context) {
        DispatchQueue.main.async {
            closure(uiView)
        }
    }
}
