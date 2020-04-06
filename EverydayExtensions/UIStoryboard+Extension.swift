//
//  UIStoryboard+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIStoryboard {
    // MARK: - Public Methods

    func instantiateViewController<T: UIViewController>(ofType type: T.Type) -> T {
        guard let viewController = instantiateViewController(withIdentifier: String(describing: type)) as? T else {
            fatalError("Could not instantiate UIViewController of type: \(String(describing: type))")
        }
        return viewController
    }
}
