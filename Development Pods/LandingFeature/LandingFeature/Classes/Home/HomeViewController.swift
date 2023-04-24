//
//  HomeViewController.swift
//  Pods
//
//  Created by John Patrick Teruel on 4/24/23.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SDWebImage
import CoreLib

protocol HomeDisplayLogic: class, CanDisplayHUD, CanDisplayAlert
{
    func displayUserProfile(viewModel: Home.UserProfile.ViewModel)
}

class HomeViewController: UIViewController, HomeDisplayLogic
{
    var interactor: HomeBusinessLogic?
    var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        let router = HomeRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: User Profile
    @IBOutlet weak var userImageView: UIImageView!
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        initialConfiguration()
        interactor?.initialLoad()
    }
    
    func initialConfiguration() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    func displayUserProfile(viewModel: Home.UserProfile.ViewModel) {
        self.userImageView.sd_setImage(with: viewModel.userImage)
    }
}