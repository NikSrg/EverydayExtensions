//
//  CGRect+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 14.04.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension CGRect {
    // MARK: - Init

    init(with size: CGSize) {
        self.init(origin: .zero, size: size)
    }

    init(width: CGFloat, height: CGFloat) {
        self.init(origin: .zero, size: CGSize(width: width, height: height))
    }
}
