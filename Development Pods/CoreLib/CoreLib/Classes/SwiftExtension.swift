//
//  SwiftExtension.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation

extension String {
    func toURL() -> URL? {
        return URL(string: self)
    }
}
