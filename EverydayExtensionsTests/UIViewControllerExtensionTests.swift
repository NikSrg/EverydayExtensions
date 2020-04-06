//
//  UIViewControllerExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UIViewControllerExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testStoryboardIdentifier() {
        XCTAssertEqual(UIViewController.identifier, "UIViewController")
    }

    func testPresentAlertController() {
        let viewController = UIViewController()
        let alertController = viewController.presentAlert(with: "Unit-Tests", message: nil, cancelButtonTitle: "OK", cancelAction: nil)
        XCTAssertNotNil(alertController)
    }

    func testAddingKeyboardWillShowObserver() {
        let keyboardWillShowExpectation = expectation(description: #function)
        let viewController = UIViewController()
        viewController.addKeyboardWillShowObserver(with: { _ in
            keyboardWillShowExpectation.fulfill()
        })
        NotificationCenter.default.post(name: UIResponder.keyboardWillShowNotification, object: nil)
        wait(for: [keyboardWillShowExpectation], timeout: 1)
    }

    func testAddingKeyboardWillHideObserver() {
        let keyboardWillHideExpectation = expectation(description: #function)
        let viewController = UIViewController()
        viewController.addKeyboardWillHideObserver(with: { _ in
            keyboardWillHideExpectation.fulfill()
        })
        NotificationCenter.default.post(name: UIResponder.keyboardWillHideNotification, object: nil)
        wait(for: [keyboardWillHideExpectation], timeout: 1)
    }

//    func testRemovingKeyboardObserver() {
//        var didCallBlock = false
//        let viewController = UIViewController()
//        viewController.addKeyboardWillHideObserver(with: { _ in
//            didCallBlock = true
//        })
//        viewController.removeKeyboardObserver()
//
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35, execute: {
//            NotificationCenter.default.post(name: UIResponder.keyboardWillHideNotification, object: nil)
//            XCTAssertFalse(didCallBlock)
//        })
//    }

    func testPerformSegue() {
        UIView.setAnimationsEnabled(false)
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: UIStoryboardExtensionTests.self))
        let navigationController = storyboard.instantiateInitialViewController() as! UINavigationController
        let firstViewController = navigationController.rootViewController
        XCTAssertNotNil(firstViewController)

        firstViewController?.performSegue(to: SecondViewController.self)
        XCTAssertTrue(navigationController.visibleViewController is SecondViewController)
    }
}
