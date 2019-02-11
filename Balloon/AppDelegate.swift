//
//  AppDelegate.swift
//  Balloon
//
//  Created by Gaétan Zanella on 11/02/2019.
//  Copyright © 2019 Gaétan Zanella. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let ballons = (0..<100).map {
            Balloon(
                text: "\($0). Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse orci nulla, semper nec massa in, commodo dignissim arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Ut nec nunc scelerisque, porttitor neque sed, laoreet est. Curabitur at tortor tristique, porttitor tortor sed, sodales risus. Vestibulum sodales nisl non enim vulputate, non vehicula nisi varius."
            )
        }
        window?.rootViewController = BalloonListViewController(balloons: ballons)
        window?.makeKeyAndVisible()
        return true
    }
}

