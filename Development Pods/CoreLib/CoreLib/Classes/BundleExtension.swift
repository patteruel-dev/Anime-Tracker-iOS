//
//  BundleExtension.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

public extension Bundle {
    static func resourceBundle(for objectClass: AnyObject.Type, resource: String) -> Bundle {
        let myBundle = Bundle(for: objectClass)
        guard let resourceBundleURL = myBundle.url(
            forResource: resource, withExtension: "bundle")
            else { fatalError("\(resource).bundle not found!") }
        guard let resourceBundle = Bundle(url: resourceBundleURL)
            else { fatalError("Cannot access \(resource).bundle!") }
        
        return resourceBundle
    }
}
