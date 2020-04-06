//
//  TimeInterval+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import Foundation

public extension TimeInterval {
    // MARK: - Public Properties

    var seconds: TimeInterval {
        return self
    }

    var minutes: TimeInterval {
        return TimeInterval(self * 60)
    }

    var hours: TimeInterval {
        return TimeInterval(minutes * 60)
    }

    var days: Double {
        return TimeInterval(hours * 24)
    }
}
