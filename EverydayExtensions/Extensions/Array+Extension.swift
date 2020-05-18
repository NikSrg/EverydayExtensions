//
//  Array+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 20.08.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension Array {
    // MARK: - Public Methods

    @discardableResult mutating func remove(where condition: @escaping (Element) -> Bool) -> Element? {
        for (index, entry) in enumerated() {
            if condition(entry) {
                return remove(at: index)
            }
        }
        return nil
    }
}

public extension Array where Element: Equatable {
    // MARK: - Public Methods

    @discardableResult mutating func remove(_ element: Element) -> Element? {
        guard let index = firstIndex(where: { $0 == element }) else {
            return nil
        }
        return remove(at: index)
    }

    func unique() -> [Element] {
        var uniqueValues = [Element]()
        forEach({
            if !uniqueValues.contains($0) {
                uniqueValues.append($0)
            }
        })
        return uniqueValues
    }
}
