//
//  AniListSessionManager.swift
//  AniListSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation

class AniListSession {
    let token: Oauth2Response
    
    init(token: Oauth2Response) {
        self.token = token
    }
}
