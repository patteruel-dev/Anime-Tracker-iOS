//
//  Oauth2TokenParameters.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

struct Oauth2TokenParameters: Codable {
    let clientId: String
    let clientSecret: String
    let code: String
    let codeVerifier: String
    let grantType: String
    
    enum CodingKeys: String, CodingKey {
        case clientId = "client_id"
        case clientSecret = "client_secret"
        case code
        case codeVerifier = "code_verifier"
        case grantType = "grant_type"
    }
    
    public func unsafeAsDictionary() -> [String: Any] {
        let data = try! JSONEncoder().encode(self)
        return try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
    }
}
