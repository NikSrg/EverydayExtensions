//
//  UIAlertAction+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 09.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIAlertAction {
    // MARK: - Public Methods

    static func cancelAction(withTitle title: String, action: (() -> Void)? = nil) -> UIAlertAction {
        return UIAlertAction(title: title, style: .default, handler: { _ in action?() })
    }
}
