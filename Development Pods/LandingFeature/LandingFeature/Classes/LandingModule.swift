//
//  LandingModule.swift
//  LandingFeature
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import CoreLib

public protocol LandingFlowDelegate {
}

public class LandingModule {
    public init() {
    }
    
    private let resourceBundle: Bundle = Bundle.resourceBundle(for: LandingModule.self, resource: "LandingFeature")
    
    private func makeLandingViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Landing", bundle: resourceBundle)
        let landingViewController = storyboard.instantiateInitialViewController()!
        return landingViewController
    }
    
    public func startLandingFlow(in navigationController: UINavigationController) {
        let landingScreen = makeLandingViewController()
        navigationController.setViewControllers([landingScreen], animated: true)
    }
}

