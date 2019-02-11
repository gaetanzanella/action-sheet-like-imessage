//
//  RoundedButton.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    // MARK: - Life Cycle

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    // MARK: - UIVIew

    override var buttonType: UIButton.ButtonType {
        return .system
    }

    override var isHighlighted: Bool {
        didSet {
            let alpha: CGFloat
            if isHighlighted {
                alpha = 0.6
            } else {
                alpha = 1
            }
            UIView.animate(withDuration: 0.3) {
                self.alpha = alpha
            }
        }
    }

    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 47)
    }

    // MARK: - Private

    private func setupView() {
        layer.cornerRadius = 8
        backgroundColor = .white
        setTitleColor(tintColor, for: .normal)
    }
}
