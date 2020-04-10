//
//  UIViewController+Extension.swift
//  EverydayExtensions
//
//  Created by Nick Sorge on 08.03.19.
//  Copyright © 2019 Nick Sorge. All rights reserved.
//

import Foundation

public extension UIViewController {
    // MARK: - Public Properties

    static var identifier: String {
        return String(describing: self)
    }

    // MARK: - Public Methods

    func performSegue(to viewController: UIViewController.Type, sender: Any? = nil) {
        performSegue(withIdentifier: viewController.identifier, sender: sender)
    }

    @discardableResult func presentAlert(with title: String?, message: String?, cancelButtonTitle cancelTitle: String = "Ok", cancelAction: (() -> Void)? = nil) -> UIAlertController {
        let alert = UIAlertController(title: title?.localized, message: message?.localized, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: cancelTitle.localized, style: .cancel, handler: { _ in cancelAction?() }))
        present(alert, animated: true, completion: nil)
        return alert
    }

    func addKeyboardWillShowObserver(with block: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main, using: block)
    }

    func addKeyboardWillHideObserver(with block: @escaping (Notification) -> Void) {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main, using: block)
    }

    func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}
