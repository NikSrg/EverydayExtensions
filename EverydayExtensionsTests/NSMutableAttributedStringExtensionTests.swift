//
//  NSMutableAttributedStringExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 05.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class NSMutableAttributedStringExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testSetAttributes() {
        let plainString = "hello world"
        let attributedText = NSMutableAttributedString(string: plainString, attributes: [.font: UIFont.systemFont(ofSize: 15)])
        attributedText.set(attributes: [.font: UIFont.boldSystemFont(ofSize: 15)], for: "world")
        XCTAssertTrue(attributedText.debugDescription.contains("font-weight: normal"))
        XCTAssertTrue(attributedText.debugDescription.contains("font-weight: bold"))
    }
}
