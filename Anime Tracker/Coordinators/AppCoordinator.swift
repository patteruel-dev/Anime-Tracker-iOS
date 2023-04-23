//
//  AppCoordinator.swift
//  Anime Tracker
//
//  Created by John Patrick Teruel on 4/19/23.
//

import Foundation
import LoginFeature
import LandingFeature
import LoginService
import MALSwift

class AppCoordinator {
    var window: UIWindow
    var rootNavigationController: UINavigationController
    
    // MARK: Services
    lazy var malService = MALService()
    lazy var loginService = LoginService(malService: malService)
    
    // MARK: Modules
    lazy var loginModule = LoginModule(delegate: self, loginService: loginService)
    lazy var landingModule = LandingModule()
    
    init(window: UIWindow) {
        self.window = window
        self.rootNavigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = rootNavigationController
        window.makeKeyAndVisible()
        
        loginModule.startLoginFlow(on: rootNavigationController)
    }
}
