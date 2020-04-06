//
//  UIScrollViewExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 29.06.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import XCTest
@testable import EverydayExtensions

class UIScrollViewExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testCurrentPage() {
        let frame = CGRect(width: 320, height: 480)
        let scrollView = UIScrollView(frame: frame)
        scrollView.contentSize = CGSize(width: frame.width * 3, height: frame.height)
        scrollView.contentOffset = CGPoint.zero
        XCTAssertEqual(scrollView.currentPage, 0)

        scrollView.contentOffset = CGPoint(x: frame.width, y: 0)
        XCTAssertEqual(scrollView.currentPage, 1)

        scrollView.contentOffset = CGPoint(x: frame.width * 2, y: 0)
        XCTAssertEqual(scrollView.currentPage, 2)
    }
}
