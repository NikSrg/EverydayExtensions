//
//  UINavigationControlerExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UINavigationControlerExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testRootViewController() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()

        let navigationController = UINavigationController(rootViewController: viewController1)
        XCTAssertEqual(navigationController.rootViewController, viewController1)

        navigationController.pushViewController(viewController2, animated: true)
        XCTAssertEqual(navigationController.rootViewController, viewController1)
    }

    func testNavigationControllerPreferredStatusBarStyle() {
        let viewController1 = UIViewController()
        let viewController2 = UIViewController()

        let navigationController = UINavigationController(rootViewController: viewController1)
        XCTAssertEqual(navigationController.preferredStatusBarStyle, viewController1.preferredStatusBarStyle)

        navigationController.pushViewController(viewController2, animated: true)
        XCTAssertEqual(navigationController.preferredStatusBarStyle, viewController2.preferredStatusBarStyle)
    }
}
