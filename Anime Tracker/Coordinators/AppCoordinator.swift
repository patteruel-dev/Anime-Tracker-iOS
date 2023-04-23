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
import AniListKtModule

class AppCoordinator {
    var window: UIWindow
    var rootNavigationController: UINavigationController

    // MARK: Services
    lazy var anilistService = AniListService(clientId: "12311", clientSecret: "J8SBs6FN6D4YxeJYeik8Vp2x1oxtAolaKV2r5Q69", redirectURI: "https://patteruel-dev.github.io/apps/anime-tracker")
    lazy var loginService = LoginService(anilistService: anilistService)
    
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
