//
//  AppCoordinator.swift
//  Anime Tracker
//
//  Created by John Patrick Teruel on 4/19/23.
//

import Foundation
import LoginFeature

class AppCoordinator {
    var window: UIWindow
    
    // MARK: Modules
    lazy var loginModule = LoginModule()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let rootNavigationController = UINavigationController()
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        loginModule.startLoginFlow(on: rootNavigationController)
    }
}
