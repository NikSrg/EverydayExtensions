//
//  UITableView+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 23.05.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit

public extension UITableView {
    // MARK: - Public Methods

    func reloadVisibleCells(withAnimation animation: RowAnimation) {
        reloadRows(at: visibleCells.compactMap({ indexPath(for: $0) }), with: animation)
    }
}
