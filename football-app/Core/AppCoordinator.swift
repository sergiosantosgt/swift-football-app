//
//  AppCoordinator.swift
//  football-app
//
//  Created by Sergio Santos on 04/09/22.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    private var window: UIWindow
    
    init(_ window: UIWindow) {
        self.window = window
    }
    
    override func start() {
        let home = HomeCoordinator()
        self.start(coordinator: home)
        
        window.rootViewController = home.navigationController
        window.makeKeyAndVisible()
    }
}
