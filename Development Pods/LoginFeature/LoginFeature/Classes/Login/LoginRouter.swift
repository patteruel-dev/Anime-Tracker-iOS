//
//  LoginRouter.swift
//  Pods
//
//  Created by John Patrick Teruel on 4/19/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import WebKit

@objc protocol LoginRoutingLogic
{
    func routeToAuthorizationWebView(url: URL)
}

protocol LoginDataPassing
{
    var dataStore: LoginDataStore? { get }
}

class LoginRouter: NSObject, LoginRoutingLogic, LoginDataPassing
{
    weak var viewController: LoginViewController?
    var dataStore: LoginDataStore?
    
    // MARK: Routing
    
    func routeToAuthorizationWebView(url: URL) {
        let webView = WKWebView()
        let webViewController = UIViewController()
        webViewController.view = webView
        viewController?.present(webViewController, animated: true)
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = viewController
    }
}
