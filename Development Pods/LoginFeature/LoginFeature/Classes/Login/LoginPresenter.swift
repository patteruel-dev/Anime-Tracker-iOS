//
//  LoginPresenter.swift
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

protocol LoginPresentationLogic
{
    func presentAuthorizationWebView(response: Login.Authorize.Response)
}

class LoginPresenter: LoginPresentationLogic
{
    weak var viewController: LoginDisplayLogic?
    
    // MARK: Do something
    
    func presentAuthorizationWebView(response: Login.Authorize.Response)
    {
        let viewModel = Login.Authorize.ViewModel(oauthURL: response.oauthURL)
        viewController?.displayAuthorizationWebView(viewModel: viewModel)
    }
}
