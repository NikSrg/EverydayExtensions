//
//  Sequence+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension Sequence {
    // MARK: - Public Methods
    
    func group<GroupingType: Hashable>(by key: (Iterator.Element) -> GroupingType) -> [[Iterator.Element]] {
        var groups: [GroupingType: [Iterator.Element]] = [:]
        var groupsOrder: [GroupingType] = []
        forEach({ element in
            let key = key(element)
            if case nil = groups[key]?.append(element) {
                groups[key] = [element]
                groupsOrder.append(key)
            }
        })
        return groupsOrder.map({ groups[$0]! })
    }
}
