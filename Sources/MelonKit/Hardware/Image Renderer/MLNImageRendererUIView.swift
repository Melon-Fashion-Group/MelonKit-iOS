//
//  MLNImageRendererUIView.swift
//  MelonKit
//
//  Created by Dimka Novikov on 01.12.2023.
//  Copyright © 2023 Melon Fashion Group. All rights reserved.
//


// MARK: Import section

import UIKit



// MARK: - MLNImageRendererUIView

///
///
///
@available(iOS 16.0, *)
public final class MLNImageRendererUIView: UIView, MLNImageRenderable {

    // MARK: - Public methods

    ///
    ///
    ///
    public func render() -> UIImage? {
        guard
            let containerView = self.superview?.superview,
            let containerSuperview = containerView.superview
        else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(bounds: containerView.frame)

        return renderer.image { (context) in
            containerSuperview.layer.render(in: context.cgContext)
        }
    }
}
