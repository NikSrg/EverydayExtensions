//
//  Protocols.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 02.03.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

// MARK: - CustomDebugDescription

public protocol CustomDebugDescription {
    var customDebugDescription: String { get }
}

public extension CustomDebugDescription {
    var customDebugDescription: String {
        let fullDescription = Mirror(reflecting: self).children.compactMap({ arg -> String? in
            guard let propertyName = arg.label else {
                return nil
            }
            return "\(propertyName): \(arg.value)"
        })

        return fullDescription.joined(separator: "\n")
    }
}

// MARK: - RequiresValue

protocol RequiresValue {
    associatedtype T

    var requiredValue: T { get set }
}
