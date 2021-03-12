//
//  Constants.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 09.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation
import UIKit

public typealias TableViewable = UITableViewDelegate & UITableViewDataSource
public typealias CollectionViewable = UICollectionViewDelegate & UICollectionViewDataSource

public let kTableViewDynamicCellHeight = UITableView.automaticDimension

@inline(__always) public func Log(_ messages: Any..., filePath: String = #file, line: Int = #line, function: String = #function) {
    let filename = URL(fileURLWithPath: filePath).deletingPathExtension().lastPathComponent
    var message = ""
    messages.forEach({
        message.append(" \($0)")
    })
    if Thread.current.isMainThread {
        print("[\(line)] \(filename).\(function):\(message)")
    }
    else {
        let threadName = (Thread.current.name?.isEmpty ?? true) ? "UNKNOWN THREAD" : Thread.current.name!
        print("\(threadName) : [\(line)] \(filename).\(function):\(message)")
    }
}

public func NSDocumentsDirectory() -> String {
    let filePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.absoluteString
    return filePath.replacingOccurrences(of: "file://", with: "")
}
