//
//  UIViewExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 29.06.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest
@testable import EverydayExtensions

class UIViewExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testPinToBounds() {
        let view = UIView(frame: CGRect(width: 100, height: 100))
        let subview = UIView(frame: CGRect(width: 10, height: 10))
        view.addSubview(subview)
        XCTAssertNotEqual(view.frame, subview.frame)

        view.pinToBounds(subview: subview)
        XCTAssertEqual(view.bounds, subview.bounds)
    }

    func testRoundCorners() {
        let view = UIView(frame: CGRect(width: 100, height: 100))
        view.roundCorners()

        XCTAssertEqual(view.layer.cornerRadius, 50)
    }

    func testRoundCornersBy() {
        let view = UIView(frame: CGRect(width: 100, height: 100))
        view.roundCornsers(by: 20)

        XCTAssertEqual(view.layer.cornerRadius, 20)
    }

    func testMaskRoundCornersBy() {
        let view = UIView(frame: CGRect(width: 100, height: 100))
        view.roundCorner([.topLeft, .topRight], by: 10)

        XCTAssertTrue(view.layer.maskedCorners.contains(CACornerMask.layerMinXMinYCorner))
        XCTAssertTrue(view.layer.maskedCorners.contains(CACornerMask.layerMaxXMinYCorner))
        XCTAssertFalse(view.layer.maskedCorners.contains(CACornerMask.layerMaxXMaxYCorner))
        XCTAssertFalse(view.layer.maskedCorners.contains(CACornerMask.layerMinXMaxYCorner))
    }
}
