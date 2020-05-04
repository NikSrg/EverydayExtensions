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
        print("\(Thread.current.name ?? "UNKNOWN THREAD") : [\(line)] \(filename).\(function):\(message)")
    }
}

public func NSDocumentsDirectory() -> String {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.absoluteString
}
