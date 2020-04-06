//
//  NSMutableAttributedString+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 10.05.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension NSMutableAttributedString {
    // MARK: - Public Methods

    func set(attributes: [NSAttributedString.Key: Any], for substring: String) {
        guard let range = string.range(of: substring) else {
            return
        }
        addAttributes(attributes, range: NSRange(range, in: self.string))
    }
}
