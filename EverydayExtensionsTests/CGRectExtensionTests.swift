//
//  CGRectExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 14.04.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest

class CGRectExtensionTests: XCTestCase {
    // MARK: - Private Properties

    private let validationRect = CGRect(x: 0, y: 0, width: 100, height: 100)

    // MARK: - Public Methods

    func testInitWithSize() {
        let rect = CGRect(with: CGSize(width: 100, height: 100))
        XCTAssertEqual(rect, validationRect)
    }

    func testInitWithWithAndHeight() {
        let rect = CGRect(width: 100, height: 100)
        XCTAssertEqual(rect, validationRect)
    }
}
