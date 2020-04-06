//
//  ArrayExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class ArrayExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testRemoveItemWithWhereCondition() {
        var items = ["1", "2", "3"]
        items.remove(where: { $0 == "1" })
        XCTAssertEqual(items.count, 2)
    }

    func testRemoveItemWhenEquable() {
        var items = ["1", "2", "3"]
        items.remove("1")
        XCTAssertEqual(items.count, 2)
    }
}
