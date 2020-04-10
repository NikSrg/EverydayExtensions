//
//  UIAlertControllerExtension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 09.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIAlertController {
    // MARK: - Public Methods

    func setPreferredAction(byTitle title: String) {
        preferredAction = actions.first(where: { $0.title == title })
    }
}
