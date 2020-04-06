//
//  UITableViewCellExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UITableViewCellExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testCellidentifier() {
        XCTAssertEqual(UITableViewCell.cellIdentifier, "UITableViewCell")
    }
}
