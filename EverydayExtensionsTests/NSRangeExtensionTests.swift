//
//  NSRangeExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 29.06.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest
@testable import EverydayExtensions

class NSRangeExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testZeroRange() {
        XCTAssertEqual(NSRange.zero, NSRange(location: 0, length: 0))
    }

    func testRangeNotFound() {
        XCTAssertEqual(NSRange.notFound, NSRange(location: NSNotFound, length: 0))
    }
}
