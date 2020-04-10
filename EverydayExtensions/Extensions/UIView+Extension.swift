//
//  UIView+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIView {
    // MARK: - Public Methods

    func pinToBounds(subview: UIView, insets: UIEdgeInsets? = nil) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([subview.leadingAnchor.constraint(equalTo: leadingAnchor, constant: insets?.left ?? 0),
                        subview.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -(insets?.right ?? 0)),
                        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets?.top ?? 0),
                        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -(insets?.bottom ?? 0))])
        layoutIfNeeded()
    }

    func roundCorners(clipToBounds clip: Bool = true) {
        layer.cornerRadius = min(bounds.width, bounds.height) / 2
        clipsToBounds = clip
    }

    func roundCornsers(by radius: CGFloat, clipToBounds clip: Bool = true) {
        layer.cornerRadius = radius
        clipsToBounds = clip
    }

    func roundCorner(_ corners: UIRectCorner, by radius: CGFloat) {
        var layerCorners = CACornerMask()
        if corners.contains(.topLeft) {
            layerCorners.insert(.layerMinXMinYCorner)
        }
        if corners.contains(.topRight) {
            layerCorners.insert(.layerMaxXMinYCorner)
        }
        if corners.contains(.bottomLeft) {
            layerCorners.insert(.layerMinXMaxYCorner)
        }
        if corners.contains(.bottomRight) {
            layerCorners.insert(.layerMaxXMaxYCorner)
        }
        layer.maskedCorners = layerCorners
        layer.cornerRadius = radius
    }

    func preferedLayoutSizeFitting(size: CGSize, horizontalFittingPriority: UILayoutPriority = .defaultHigh, verticalFittingPriority: UILayoutPriority = .fittingSizeLevel) -> CGSize {
        return systemLayoutSizeFitting(size, withHorizontalFittingPriority: horizontalFittingPriority, verticalFittingPriority: verticalFittingPriority)
    }

    static func nib(in bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: String(describing: self), bundle: bundle)
    }

    func nib(in bundle: Bundle? = nil) -> UINib {
        return UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    }

    static func nibView(withOwner owner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: String(describing: self), bundle: bundle).instantiate(withOwner: owner, options: options).first as? UIView
    }

    func nibView(withOwner owner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil, bundle: Bundle? = nil) -> UIView? {
        return UINib(nibName: String(describing: type(of: self)), bundle: bundle).instantiate(withOwner: owner, options: options).first as? UIView
    }
}
