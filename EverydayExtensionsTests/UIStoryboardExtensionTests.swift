//
//  UIStoryboardExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 05.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UIStoryboardExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testStoryboardInstantiateViewControllerOfTypeExtension() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: UIStoryboardExtensionTests.self))
        XCTAssertNotNil(storyboard)
        XCTAssertNotNil(storyboard.instantiateViewController(ofType: FirstViewController.self))
        XCTAssertNotNil(storyboard.instantiateViewController(ofType: SecondViewController.self))
    }
}
