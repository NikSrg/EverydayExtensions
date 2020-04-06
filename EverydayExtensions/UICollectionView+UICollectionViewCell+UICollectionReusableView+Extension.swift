//
//  UICollectionView+UICollectionViewCell+UICollectionReusableView+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UICollectionView {
    // MARK: - Public Methods

    func registerCell<T: UICollectionViewCell>(ofType type: T.Type) {
        register(type.nib(), forCellWithReuseIdentifier: type.cellIdentifier)
    }

    func dequeueCell<T: UICollectionViewCell>(of type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: type.cellIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue resuable cell of type \(T.self)")
        }
        return cell
    }
}

public extension UICollectionReusableView {
    // MARK: - Public Properties

    static var cellIdentifier: String {
        return String(describing: self)
    }

    static var nibName: String {
        return String(describing: self)
    }
}
