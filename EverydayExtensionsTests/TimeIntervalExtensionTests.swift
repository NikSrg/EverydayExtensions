//
//  TimeIntervalExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 19.06.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest

class TimeIntervalExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testExtensions() {
        let format = "dd.MM.yyyy HH:mm:ss"
        let startDate = "01.01.2000 00:00:00".toDate(withFormat: format)!
        let onePointFive = TimeInterval(1.5)

        var date = startDate.addingTimeInterval(onePointFive.seconds)
        var dateString = date.string(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertEqual(dateString, "01.01.2000 00:00:01")

        date = startDate.addingTimeInterval(onePointFive.minutes)
        dateString = date.string(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertEqual(dateString, "01.01.2000 00:01:30")

        date = startDate.addingTimeInterval(onePointFive.hours)
        dateString = date.string(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertEqual(dateString, "01.01.2000 01:30:00")

        date = startDate.addingTimeInterval(onePointFive.days)
        dateString = date.string(withFormat: "dd.MM.yyyy HH:mm:ss")
        XCTAssertEqual(dateString, "02.01.2000 12:00:00")
    }
}
