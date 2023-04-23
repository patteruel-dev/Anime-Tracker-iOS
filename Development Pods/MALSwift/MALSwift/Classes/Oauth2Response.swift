//
//  Oauth2Response.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

public struct Oauth2Response {
    let code: String
    let state: String
    
    public init(code: String, state: String) {
        self.code = code
        self.state = state
    }
}

