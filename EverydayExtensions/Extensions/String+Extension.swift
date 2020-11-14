//
//  String+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension String {
    // MARK: - Private Properties

    private static let dateFormatter = DateFormatter()

    // MARK: - Public Properties

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    // MARK: - Public Methods

    func substringTo(index i: Int) -> String {
        guard
            i > -1, i < self.count,
            let range = Range(NSRange(location: 0, length: i), in: self) else {
            return self
        }
        return String(self[range])
    }

    func rangeOfSubstring(_ substring: String) -> NSRange {
        guard let range = range(of: substring) else {
            return .notFound
        }
        return NSRange(range, in: self)
    }

    func asURL() -> URL? {
        return URL(string: self)
    }

    func toDate(withFormat format: String) -> Date? {
        let dateFormatter = String.dateFormatter
        dateFormatter.dateFormat = format
        return dateFormatter.date(from: self)
    }

    func localizedString(from bundle: Bundle = Bundle.main) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }

    func localizedString(fromBundleFor forClass: AnyClass) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle(for: forClass), value: "", comment: "")
    }
}
