//
//  UINavigationController+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 11.09.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UINavigationController {
    // MARK: - Public Properties

    var rootViewController: UIViewController? {
        return viewControllers.first
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        visibleViewController?.preferredStatusBarStyle ?? .lightContent
    }
}
