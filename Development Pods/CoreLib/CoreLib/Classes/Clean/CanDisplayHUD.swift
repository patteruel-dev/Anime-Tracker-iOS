//
//  CanDisplayHUD.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import ProgressHUD

public protocol CanDisplayHUD {
    func displayHUD()
    func dismissHUD()
}

public extension CanDisplayHUD where Self: UIViewController  {
    func displayHUD() {
        ProgressHUD.show()
    }
    
    func dismissHUD() {
        ProgressHUD.dismiss()
    }
}

