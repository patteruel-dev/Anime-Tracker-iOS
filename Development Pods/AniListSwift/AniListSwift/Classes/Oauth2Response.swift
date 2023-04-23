//
//  Oauth2Response.swift
//  AniListSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

public struct Oauth2Response: Codable {
    let accessToken: String
    let tokenType: String
    let expiresIn: Int
    
    public init(accessToken: String, tokenType: String, expiresIn: Int) {
        self.accessToken = accessToken
        self.tokenType = tokenType
        self.expiresIn = expiresIn
    }
}

