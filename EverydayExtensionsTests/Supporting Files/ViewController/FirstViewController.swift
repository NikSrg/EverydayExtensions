//
//  FirstViewController.swift
//  EverydayExtensionsTests
//
//  Created by Nick Sorge on 05.04.20.
//  Copyright © 2020 Nick Sorge. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // MARK: - Public Properties

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }

    var items = [1, 2, 3]

    // MARK: - Delegates

    // MARK: UITableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: SingleLabelTableViewCell.self)
        cell.label.text = "\(items[indexPath.row])"
        return cell
    }
}

