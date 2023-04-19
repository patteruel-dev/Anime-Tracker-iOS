//
//  LoginModule.swift
//  LoginFeature
//
//  Created by John Patrick Teruel on 4/19/23.
//

import Foundation

public class LoginModule {
    public init() {}
    
    private func getLoginViewController() -> LoginViewController {
        let storyboard = UIStoryboard(name: "Login", bundle: resourceBundle)
        let loginViewController = storyboard.instantiateInitialViewController() as! LoginViewController
        return loginViewController
    }
    
    private func getSplashScreenViewController() -> SplashScreenViewController {
        let storyboard = UIStoryboard(name: "SplashScreen", bundle: resourceBundle)
        let splashScreenViewController = storyboard.instantiateInitialViewController() as! SplashScreenViewController
        return splashScreenViewController
    }
    
    public func startLoginFlow(on navigationController: UINavigationController) {
//        navigationController.pushViewController(getSplashScreenViewController(), animated: false)
        navigationController.pushViewController(getLoginViewController(), animated: false)
    }
    
    private let resourceBundle: Bundle = {
        let myBundle = Bundle(for: LoginModule.self)
        guard let resourceBundleURL = myBundle.url(
            forResource: "LoginFeature", withExtension: "bundle")
            else { fatalError("LoginFeature.bundle not found!") }

        guard let resourceBundle = Bundle(url: resourceBundleURL)
            else { fatalError("Cannot access LoginFeature.bundle!") }

        return resourceBundle
    }()
}
