//
//  BalloonView.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

class BalloonView: UIView {

    private let label = UILabel()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }

    // MARK: - UIView

    override func tintColorDidChange() {
        super.tintColorDidChange()
        backgroundColor = tintColor
    }

    // MARK: - Public

    func configure(for balloon: Balloon) {
        label.text = balloon.text
    }

    // MARK: - Private

    private func setUpView() {
        addSubview(label)
        label.pinToSuperview(with: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
        label.textColor = .white
        label.numberOfLines = 0
        backgroundColor = tintColor
    }
}
