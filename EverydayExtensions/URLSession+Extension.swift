//
//  URLSession+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 05.04.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension URLSession {
    // MARK: - Public Methods

    func asyncAwait(with URL: URL) -> (data: Data?, response: URLResponse?, error: Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?

        let semaphore = DispatchSemaphore(value: 0)
        let task = dataTask(with: URL) { _data, _response, _error in
            data = _data
            response = _response
            error = _error
            semaphore.signal()
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)

        return (data, response, error)
    }

    func asyncAwait(with request: URLRequest) -> (data: Data?, response: URLResponse?, error: Error?) {
        var data: Data?
        var response: URLResponse?
        var error: Error?

        let semaphore = DispatchSemaphore(value: 0)
        let task = dataTask(with: request) { _data, _response, _error in
            data = _data
            response = _response
            error = _error
            semaphore.signal()
        }
        task.resume()
        _ = semaphore.wait(timeout: .distantFuture)

        return (data, response, error)
    }
}
