//
//  UITableView+UITableViewCell+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - Public Methods

    func registerCell<T: UITableViewCell>(ofType type: T.Type, in bundle: Bundle? = nil) {
        register(type.nib(in: bundle), forCellReuseIdentifier: type.cellIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(ofType type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.cellIdentifier) as? T else {
            fatalError("failed to dequeue cell of type \(type). Cellidentifier has the be same as the class-name")
        }
        return cell
    }
}

public extension UITableViewCell {
    // MARK: - Public Properties

    static var cellIdentifier: String {
        return String(describing: self)
    }
}
