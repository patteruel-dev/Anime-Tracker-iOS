//
//  LoginService.swift
//  LoginService
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import AniListKtModule
import CoreLib

public class LoginService {
    let anilistService: AniListService
    
    public init (anilistService: AniListService) {
        self.anilistService = anilistService
    }
    
    public func getOauth2URL() -> URL {
        try! anilistService.oauth2URL().asURL()
    }
    
    public func parseToken(from url: URL?) -> OAuthToken? {
        guard let url = url else {
            return nil
        }
        return anilistService.parseToken(url: url.absoluteString)
    }
    
    public func authorizeUser(token: OAuthToken) {
        anilistService.authorizeUser(token: token)
    }
    
    public func reauthorizeUser() -> Bool {
        anilistService.reauthorizeUser()
    }
}
