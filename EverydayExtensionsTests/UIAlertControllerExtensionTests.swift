//
//  UIAlertControllerExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 09.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UIAlertControllerExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testPrefferedActionByTitle() {
        let alert = UIAlertController(title: "Unit-Test", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Go", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        alert.setPreferredAction(byTitle: "Go")
        XCTAssertEqual(alert.preferredAction?.title, "Go")
    }
}
