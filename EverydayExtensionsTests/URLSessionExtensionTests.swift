//
//  URLSessionExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 05.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class URLSessionExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testAsyncAwaitWithRequestExtension() {
        var request = URLRequest(url: "https://github.com/NikSrg/EverydayExtensions".asURL()!)
        request.httpMethod = "HEAD"
        let result = URLSession.shared.asyncAwait(with: request)
        guard result.error?._code != -1009 else {
            return
        }
        let httpRespone = result.response as? HTTPURLResponse
        XCTAssertEqual(httpRespone?.statusCode, 200)
    }

    func testAsyncAwaitWithURLExtension() {
        let result = URLSession.shared.asyncAwait(with: "https://github.com/NikSrg/EverydayExtensions".asURL()!)
        guard result.error?._code != -1009 else {
            return
        }
        let httpRespone = result.response as? HTTPURLResponse
        XCTAssertEqual(httpRespone?.statusCode, 200)
    }
}
