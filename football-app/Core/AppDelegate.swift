//
//  AppDelegate.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let appCoordinator = AppCoordinator(window!)
        appCoordinator.start()
        return true
    }
}
