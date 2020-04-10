//
//  UIScrollView+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 20.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

extension UIScrollView {
    // MARK: - Public Properties

    public var currentPage: Int {
        return Int((contentOffset.x + (frame.size.width / 2)) / frame.width)
    }
}
