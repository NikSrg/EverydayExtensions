//
//  URLRequestOperation.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 13.11.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

public typealias URLRequestOperationCompletionBlock = ((Data?, URLResponse?, Error?) -> Void?)

public enum State: String {
    case ready, executing, finished, cancelled

    fileprivate var keyPath: String {
        return "is" + rawValue.capitalized
    }
}

public class URLRequestOperation: Operation {
    // MARK: - Private Properties

    private var task: URLSessionTask?
    private var sessionConfigurartion: URLSessionConfiguration?
    private var sessionResponseBlock: URLRequestOperationCompletionBlock?

    // MARK: - Public Properties

    private(set) var request: URLRequest!

    private(set) var response: (data: Data?, response: URLResponse?, error: Error?)

    public var state = State.ready {
        willSet {
            willChangeValue(forKey: state.keyPath)
            willChangeValue(forKey: newValue.keyPath)
        }
        didSet {
            didChangeValue(forKey: oldValue.keyPath)
            didChangeValue(forKey: state.keyPath)
        }
    }

    public override var isAsynchronous: Bool {
        return true
    }

    public override var isExecuting: Bool {
        return state == .executing
    }

    public override var isFinished: Bool {
        return state == .finished
    }

    public override var isCancelled: Bool {
        return state == .cancelled
    }

    // MARK: - Init

    init(with request: URLRequest, configuration: URLSessionConfiguration? = nil, completion: URLRequestOperationCompletionBlock? = nil) {
        self.request = request
        self.sessionConfigurartion = configuration
        self.sessionResponseBlock = completion
    }

    // MARK: - Public Methods

    public override func main() {
        if let configuration = sessionConfigurartion {
            task = URLSession(configuration: configuration).dataTask(with: request, completionHandler: { data, response, error in
                self.response = (data, response, error)
                self.sessionResponseBlock?(data, response, error)
                self.state = .finished
            })
        }
        else {
            task = URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                self.response = (data, response, error)
                self.sessionResponseBlock?(data, response, error)
                self.state = .finished
            })
        }
        task?.resume()
    }

    public override func start() {
        guard !isCancelled else {
            return
        }
        main()
        state = .executing
    }

    public override func cancel() {
        task?.cancel()
        state = .cancelled
    }
}
