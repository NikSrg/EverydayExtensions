//
//  UIAlertActionExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 09.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UIAlertActionExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testCancelAction() {
        let alert = UIAlertController(title: "Unit-Test", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction.cancelAction(withTitle: "Cancel"))
        XCTAssertEqual(alert.actions.count, 1)
        XCTAssertEqual(alert.actions.first?.title, "Cancel")
    }
}
