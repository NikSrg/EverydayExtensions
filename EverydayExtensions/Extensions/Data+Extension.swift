//
//  Data+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension Data {
    // MARK: - Public Methods

    func toString(encoded encoding: String.Encoding = .utf8) -> String? {
        return String(data: self, encoding: encoding)
    }
}
