//
//  CanPresentAlert.swift
//  Alamofire
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

public protocol CanPresentAlert {
    func presentAlert(title: String, message: String, buttonTitle: String)
}

extension CanPresentAlert {
    public func presentAlert(title: String, message: String) {
        self.presentAlert(title: title, message: message, buttonTitle: "OK")
    }
}
