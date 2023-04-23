//
//  CanDisplayAlert.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

public protocol CanDisplayAlert {
    func displayAlert(title: String, message: String, actionTitle: String)
}

public extension CanDisplayAlert {
    func displayAlert(title: String, message: String) {
        displayAlert(title: title, message: message, actionTitle: "OK")
    }
}

public extension CanDisplayAlert where Self: UIViewController {
    func displayAlert(title: String, message: String, actionTitle: String) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
