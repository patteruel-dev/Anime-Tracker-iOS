//
//  MALSessionManager.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

class MALSession {
    let token: Oauth2TokenResponse
    
    init(token: Oauth2TokenResponse) {
        self.token = token
    }
}
