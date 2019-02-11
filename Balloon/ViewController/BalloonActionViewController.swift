//
//  BalloonActionViewController.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

protocol BalloonActionViewControllerDelegate: class {
    func viewControllerDidRequestToDismiss(_ viewController: BalloonActionViewController)
    func viewController(_ viewController: BalloonActionViewController,
                        willDisplayBalloon balloon: UICoordinateSpace,
                        coordinator: UIViewControllerTransitionCoordinator?)
}

class BalloonActionViewController: UIViewController {

    weak var delegate: BalloonActionViewControllerDelegate?

    let balloon: Balloon
    let fromBalloonCoordinateSpace: UICoordinateSpace

    private lazy var actionButton = RoundedButton()
    private lazy var balloonView = BalloonView()


    // MARK: - Life Cycle

    init(ballon: Balloon, fromBalloonCoordinateSpace: UICoordinateSpace) {
        self.balloon = ballon
        self.fromBalloonCoordinateSpace = fromBalloonCoordinateSpace
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        actionButton.topAnchor.constraint(greaterThanOrEqualTo: balloonView.bottomAnchor, constant: 20).isActive = true
        transitionCoordinator?.animate(alongsideTransition: { _ in
            self.view.layoutIfNeeded()
            self.delegate?.viewController(self, willDisplayBalloon: self.balloonView, coordinator: self.transitionCoordinator)
        }, completion: nil)
    }

    // MARK: - Private

    private func setUpController() {
        view.backgroundColor = UIColor(white: 0, alpha: 0.4)
        let fromBalloonFrame = fromBalloonCoordinateSpace.convert(fromBalloonCoordinateSpace.bounds, to: view)
        balloonView.configure(for: balloon)
        view.addSubview(balloonView)
        balloonView.translatesAutoresizingMaskIntoConstraints = false
        let topBalloonConstraint = balloonView.topAnchor.constraint(equalTo: view.topAnchor, constant: fromBalloonFrame.minY)
        topBalloonConstraint.priority = .defaultLow
        topBalloonConstraint.isActive = true
        balloonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: fromBalloonFrame.minX).isActive = true
        balloonView.widthAnchor.constraint(equalToConstant: fromBalloonFrame.width).isActive = true
        balloonView.heightAnchor.constraint(equalToConstant: fromBalloonFrame.height).isActive = true
        view.addSubview(actionButton)
        actionButton.pinToSuperview(
            with: UIEdgeInsets(top: 0, left: 20, bottom: 20, right: 20),
            edges: [.left, .right, .bottom]
        )
        actionButton.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        actionButton.setTitle("Dismiss", for: .normal)
        actionButton.tintColor = .red
    }

    @objc private func buttonAction(_ sender: UIButton) {
        delegate?.viewControllerDidRequestToDismiss(self)
    }
}
