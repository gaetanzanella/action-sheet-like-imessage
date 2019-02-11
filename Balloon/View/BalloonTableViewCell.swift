//
//  BalloonTableViewCell.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

class BalloonTableViewCell: UITableViewCell {

    let balloonView = BalloonView()

    // MARK: - UITableViewCell

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    // MARK: - Public

    func configure(for balloon: Balloon) {
        balloonView.configure(for: balloon)
    }

    // MARK: - Private

    private func setUpView() {
        selectionStyle = .none
        contentView.addSubview(balloonView)
        balloonView.pinToSuperview(with: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
}
