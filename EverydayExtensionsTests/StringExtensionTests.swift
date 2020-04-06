//
//  StringExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 09.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest
@testable import EverydayExtensions

class StringExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testToURL() {
        XCTAssertNotNil("https://google.com".asURL())
        XCTAssertNil("".asURL())
    }

    func testSubstring() {
        XCTAssertEqual("Hello World".substringTo(index: 5), "Hello")
        XCTAssertEqual("Hello World".substringTo(index: -1), "Hello World")
        XCTAssertEqual("Hello World".substringTo(index: 100), "Hello World")
    }

    func testRangeOfString() {
        let range = "Hello World".rangeOfSubstring("Hello")
        XCTAssertEqual(range, NSMakeRange(0, 5))

        let failedRange = "Hello World".rangeOfSubstring("unkown")
        XCTAssertEqual(failedRange, NSRange.notFound)
    }

    func testToDate() {
        let date = "01.01.2000".toDate(withFormat: "dd.MM.yyyy")
        XCTAssertNotNil(date)

        let components = date!.components([.day, .month, .year])
        XCTAssertEqual(components.day, 1)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2000)

        let failedDate = "01.01.2000".toDate(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertNil(failedDate)
    }

    func testLocalizedString() {
        let localized = "unit_test".localizedString(from: Bundle(for: StringExtensionTests.self))
        XCTAssertEqual(localized, "Unit Test")

        let localizedForSelf = "unit_test".localizedString(fromBundleFor: StringExtensionTests.self)
        XCTAssertEqual(localizedForSelf, "Unit Test")
    }

    func testMainBundleLocalizedString() {
        // .localized is using Bundle.main. so translation shoud fail
        let local = "unit_test".localized
        XCTAssertNotEqual(local, "Unit Test")
    }
}
