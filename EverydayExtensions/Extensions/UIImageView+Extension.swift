//
//  UIImageView+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 05.04.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import UIKit

public extension UIImageView {
    // MARK: - Public Methods

    func showSpinner(_ show: Bool, style: UIActivityIndicatorView.Style = .white, color: UIColor = .white) {
        if show {
            let spinner = UIActivityIndicatorView(style: style)
            spinner.color = color
            spinner.startAnimating()
            spinner.translatesAutoresizingMaskIntoConstraints = false
            addSubview(spinner)
            addConstraints([spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
                            spinner.centerYAnchor.constraint(equalTo: centerYAnchor)])
        }
        else {
            subviews.forEach({
                if let subview = $0 as? UIActivityIndicatorView {
                    subview.removeFromSuperview()
                }
            })
        }
    }

    func imageFrom(_ URL: URL, checkTempDirectory: Bool = true, storeImge: Bool = true, showSpinner show: Bool = true, spinnerColor: UIColor = .white) {
        if let image = imageFromTempDirectory(for: URL) {
            self.image = image
            return
        }

        if show {
            showSpinner(true, color: spinnerColor)
        }

        DispatchQueue(label: "de.melAncHOLY_MAN.EverydayExtensions", qos: .background).async {
            guard let data = try? Data(contentsOf: URL) else {
                DispatchQueue.main.async {
                    self.showSpinner(false)
                }
                return
            }

            if storeImge {
                self.storeImageDataInTempFolder(data, for: URL)
            }

            DispatchQueue.main.async {
                self.showSpinner(false)
                self.image = UIImage(data: data)
            }
        }
    }

    func imageFrom(_ URL: URL, customFilename: String, checkTempDirectory: Bool = true, storeImge: Bool = true, showSpinner show: Bool = true, spinnerColor: UIColor = .white) {
        if let image = imageFromTempDirectory(for: URL, filename: customFilename) {
            self.image = image
            return
        }

        if show {
            showSpinner(true, color: spinnerColor)
        }

        DispatchQueue(label: "de.melAncHOLY_MAN.EverydayExtensions", qos: .background).async {
            guard let data = try? Data(contentsOf: URL) else {
                DispatchQueue.main.async {
                    self.showSpinner(false)
                }
                return
            }

            if storeImge {
                self.storeImageDataInTempFolder(data, for: URL, filename: customFilename)
            }

            DispatchQueue.main.async {
                self.showSpinner(false)
                self.image = UIImage(data: data)
            }
        }
    }

    func imageFromTempDirectory(for URL: URL, filename: String? = nil) -> UIImage? {
        let path = NSTemporaryDirectory().appending(filename ?? URL.lastPathComponent)
        if FileManager.default.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        }
        return nil
    }

    @discardableResult func storeImageDataInTempFolder(_ image: Data, for URL: URL, filename: String? = nil) -> Bool {
        let path = NSTemporaryDirectory().appending(filename ?? URL.lastPathComponent)
        return FileManager.default.createFile(atPath: path, contents: image, attributes: nil)
    }
}
