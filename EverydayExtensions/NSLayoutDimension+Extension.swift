//
//  NSLayoutDimension+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension NSLayoutDimension {
    // MARK: - Public Methods

    func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat = 1, constant c: CGFloat = 0, identifier i: String? = nil, priority: UILayoutPriority = .required) -> NSLayoutConstraint {
        let newConstraint = constraint(equalTo: anchor, multiplier: m, constant: c)
        newConstraint.identifier = i
        newConstraint.priority = priority
        return newConstraint
    }
}
