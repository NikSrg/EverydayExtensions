//
//  DateExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 09.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest

class DateExtensionTests: XCTestCase {
    // MARK: - Private Properties

    private var date: Date {
        let date = "01.01.2000".toDate(withFormat: "dd.MM.yyyy")
        XCTAssertNotNil(date)
        return date!
    }

    // MARK: - Public Methods

    func testStartOfDay() {
        let components = date.components()
        print(components)
        XCTAssertEqual(components.day, 1)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2000)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testEndOfDay() {
        let date = "01.01.2000 01:01:01".toDate(withFormat: "dd.MM.yyyy HH:mm:ss")?.endOfDay
        XCTAssertNotNil(date)

        let components = date!.components([.day, .month, .year, .hour, .minute, .second])
        print(components)
        XCTAssertEqual(components.day, 1)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2000)
        XCTAssertNotEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 59)
        XCTAssertEqual(components.second, 59)
    }

    func testAddAmount() {
        let newDate = date.adding(1, to: .day)
        XCTAssertNotNil(date)
        XCTAssertNotNil(newDate)
        XCTAssertTrue(newDate! > date)

        var mutatingDate = "01.01.2000".toDate(withFormat: "dd.MM.yyyy")
        XCTAssertNotNil(mutatingDate)
        mutatingDate!.add(1, to: .day)
        XCTAssertEqual(mutatingDate!.components([.day]).day, 2)
    }

    func testAddComponent() {
        var date = self.date
        date.add([.day: 1, .hour: 1])

        let components = date.components()
        XCTAssertEqual(components.day, 2)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2000)
        XCTAssertEqual(components.hour, 1)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testSetDateComponents() {
        var date = self.date
        date.set([.day: 2, .month: 2, .year: 2001])
        let components = date.components()
        XCTAssertEqual(components.day, 2)
        XCTAssertEqual(components.month, 2)
        XCTAssertEqual(components.year, 2001)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testComponents() {
        let components = date.components()
        XCTAssertEqual(components.day, 1)
        XCTAssertEqual(components.month, 1)
        XCTAssertEqual(components.year, 2000)
        XCTAssertEqual(components.hour, 0)
        XCTAssertEqual(components.minute, 0)
        XCTAssertEqual(components.second, 0)
    }

    func testComponentsFromDateToDate() {
        let toDate = "02.01.2000 00:00:00".toDate(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertNotNil(toDate)

        let daysBetween = date.components([.day], toDate: toDate!).day
        XCTAssertEqual(daysBetween, 1)
    }

    func testLocalizedString() {
        let localizedString = date.localizedString(withDateStyle: .medium, timeStyle: .medium)
        XCTAssertEqual(localizedString, "Jan 1, 2000 at 12:00:00 AM")
    }

    func testStringWithFormat() {
        let string = date.string(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertEqual(string, "01.01.2000 00:00:00")
    }
}
