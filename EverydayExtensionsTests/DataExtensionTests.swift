//
//  DataExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class DataExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testDataToString() {
        let data = "hello world".data(using: .utf8)
        let string = data?.toString()
        XCTAssertEqual(string, "hello world")
    }
}
