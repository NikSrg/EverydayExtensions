//
//  UITableViewExtensionTests.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 04.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import XCTest

class UITableViewExtensionTests: XCTestCase {
    // MARK: - Public Methods

    func testRegisterCellTableViewExtension() {
        let bundle = Bundle(for: UITableViewExtensionTests.self)
        let firstViewController = (UIStoryboard(name: "Main", bundle: bundle).instantiateInitialViewController() as! UINavigationController).rootViewController as! FirstViewController
        firstViewController.loadView()

        let tableView = firstViewController.tableView
        tableView?.registerCell(ofType: SingleLabelTableViewCell.self, in: bundle)
        let cell = tableView?.dequeueReusableCell(ofType: SingleLabelTableViewCell.self)
        XCTAssertNotNil(cell)
        XCTAssertEqual(SingleLabelTableViewCell.cellIdentifier, "SingleLabelTableViewCell")
    }
}
