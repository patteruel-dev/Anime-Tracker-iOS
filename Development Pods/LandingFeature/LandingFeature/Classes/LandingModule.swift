//
//  LandingModule.swift
//  LandingFeature
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import CoreLib
import UserService

public protocol LandingFlowDelegate {
}

public class LandingModule {
    var moduleData: LandingModuleData
    
    public init(delegate: LandingFlowDelegate, userService: UserService) {
        self.moduleData = LandingModuleData(delegate: delegate, userService: userService)
    }
    
    private let resourceBundle: Bundle = Bundle.resourceBundle(for: LandingModule.self, resource: "LandingFeature")
    
    private func makeLandingViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Landing", bundle: resourceBundle)
        let homeViewController = storyboard.instantiateInitialViewController() as! HomeViewController
        var homeDS = homeViewController.router?.dataStore
        homeDS?.moduleData = moduleData
        return homeViewController
    }
    
    public func startLandingFlow(in navigationController: UINavigationController) {
        let landingScreen = makeLandingViewController()
        navigationController.setViewControllers([landingScreen], animated: true)
    }
}

struct LandingModuleData {
    let delegate: LandingFlowDelegate
    let userService: UserService
}
