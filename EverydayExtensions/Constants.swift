//
//  Constants.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 09.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation
import UIKit

public typealias TableViewDataSourceAndDelegates = UITableViewDelegate & UITableViewDataSource
public typealias CollectionViewDataSourceAndDelegates = UICollectionViewDelegate & UICollectionViewDataSource

public let kTableViewDynamicCellHeight = UITableView.automaticDimension

public func Log(_ messages: Any..., filePath: String = #file, line: Int = #line, function: String = #function) {
    let filename = URL(fileURLWithPath: filePath).deletingPathExtension().lastPathComponent
    var message = ""
    messages.forEach({
        message.append(" \($0)")
    })
    if Thread.current.isMainThread {
        print("[\(line)] \(filename).\(function):\(message)")
    }
    else {
        var threadName = (Thread.current.name?.isEmpty ?? true) ? "UNKNOWN THREAD" : Thread.current.name!
        threadName = "[\(threadName)]"
        print("\(threadName) : [\(line)] \(filename).\(function):\(message)")
    }
}
