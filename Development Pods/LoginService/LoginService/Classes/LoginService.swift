//
//  LoginService.swift
//  LoginService
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import AniListSwift

public class LoginService {
    let anilistService: AniListService
    let redirectURI = "https://patteruel-dev.github.io/apps/anime-tracker"
    
    private lazy var state: String = UUID().uuidString
    
    public init (anilistService: AniListService) {
        self.anilistService = anilistService
    }
    
    public func getOauth2URL() -> URL {
        anilistService.oauth2URL(state: state)
    }
    
    public func parseUrl(_ url: URL?) -> Oauth2Response? {
        let match = "\(redirectURI)#"
        let replace = "\(redirectURI)?"
        guard let url = url,
              url.absoluteString.contains(redirectURI),
              let components = URLComponents(string: url.absoluteString.replacingOccurrences(of: match, with: replace)) else {
            return nil
        }
        // attempt to extract code and state from the url components
        guard let accessToken = components.queryItems?.first(where: { $0.name == "access_token"})?.value,
              let tokenType = components.queryItems?.first(where: { $0.name == "token_type"})?.value,
              let expiresInRaw = components.queryItems?.first(where: { $0.name == "expires_in"})?.value,
              let expiresIn = Int(expiresInRaw) else {
            return nil
        }
        return Oauth2Response(accessToken: accessToken, tokenType: tokenType, expiresIn: expiresIn)
    }
    
    public func authorizeUser(oauthResponse: Oauth2Response) async throws {
        try await anilistService.authorizeUser(oauthResponse: oauthResponse)
    }
}
