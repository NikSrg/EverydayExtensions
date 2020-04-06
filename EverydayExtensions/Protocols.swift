//
//  Protocols.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 02.03.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

public protocol CustomDebugDescription {
    var customDebugDescription: String { get }
}

public extension CustomDebugDescription {
    // MARK: - Public Properties

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
