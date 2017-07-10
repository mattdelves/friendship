//
//  AppDelegate.swift
//  Friendship
//
//  Created by Matthew Delves on 10/7/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import ReSwift
import ReSwiftRouter

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        appCoordinator = AppCoordinator(window: window)
        appCoordinator?.start()

        return true
    }
}

