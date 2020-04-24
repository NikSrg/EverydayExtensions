//
//  UIImage+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 24.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIImage {
    // MARK: - Public Methods

    func resize(to newSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            draw(in: CGRect(origin: .zero, size: newSize))
        }
    }

    func scale(by factor: Double) -> UIImage {
        let newSize = CGSize(width: size.width * CGFloat(factor), height: size.height * CGFloat(factor))
        return resize(to: newSize)
    }
}
