//
//  NSRange+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 10.05.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension NSRange {
    // MARK: - Public Properties

    static var zero: NSRange {
        return NSRange(location: 0, length: 0)
    }

    static var notFound: NSRange {
        return NSRange(location: NSNotFound, length: 0)
    }
}
