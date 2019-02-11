//
//  BalloonListViewController.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

class BalloonListViewController: UITableViewController {

    private let balloons: [Balloon]

    // MARK: - Life Cycle

    init(balloons: [Balloon]) {
        self.balloons = balloons
        super.init(style: .plain)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UITableViewController

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return balloons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "balloon"
        let tableViewCell: BalloonTableViewCell
        if let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? BalloonTableViewCell {
            tableViewCell = cell
        } else {
            tableViewCell = BalloonTableViewCell(style: .default, reuseIdentifier: identifier)
        }
        tableViewCell.configure(for: balloons[indexPath.row])
        return tableViewCell
    }
}

