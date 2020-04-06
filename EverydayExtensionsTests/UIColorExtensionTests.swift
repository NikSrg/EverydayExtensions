//
//  UIColorTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 29.06.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest
@testable import EverydayExtensions

class UIColorTests: XCTestCase {
    // MARK: - Public Methods

    func testRandomColor() {
        let randomColor = UIColor.random
        XCTAssertNotNil(randomColor)

        let otherRandomColor = UIColor.random
        XCTAssertNotEqual(randomColor, otherRandomColor)
    }

    func testColorFromRGB() {
        let color = UIColor(r: 1, g: 1, b: 1)
        XCTAssertEqual(color.description, "UIExtendedSRGBColorSpace 0.00392157 0.00392157 0.00392157 1")
    }

    func testColorFromHex() {
        let color = UIColor(hex: "#000000")
        XCTAssertEqual(color.description, "UIExtendedSRGBColorSpace 0 0 0 1")
    }
}
