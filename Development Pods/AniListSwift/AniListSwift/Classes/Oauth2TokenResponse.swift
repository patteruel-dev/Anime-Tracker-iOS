//
//  Oauth2TokenResponse.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

struct Oauth2TokenResponse: Codable {
    let tokenType: String
    let expiresIn: Int
    let accessToken: String
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case tokenType = "token_type"
        case expiresIn = "expires_in"
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
    }
}
