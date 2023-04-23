//
//  AppCoordinator.swift
//  Anime Tracker
//
//  Created by John Patrick Teruel on 4/19/23.
//

import Foundation
import LoginFeature
import LoginService
import MALSwift

class AppCoordinator {
    var window: UIWindow
    
    // MARK: Services
    lazy var malService = MALService()
    lazy var loginService = LoginService(malService: malService)
    
    // MARK: Modules
    lazy var loginModule = LoginModule(delegate: self, loginService: loginService)
    
    
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
