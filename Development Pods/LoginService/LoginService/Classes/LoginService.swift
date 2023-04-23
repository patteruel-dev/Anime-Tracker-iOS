//
//  LoginService.swift
//  LoginService
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import MALSwift

public class LoginService {
    let malService: MALService
    let redirectURI = "https://patteruel-dev.github.io/apps/anime-tracker"
    
    private lazy var state: String = UUID().uuidString
    
    public init (malService: MALService) {
        self.malService = malService
    }
    
    public func getOauth2URL() -> URL {
        malService.oauth2URL(state: state)
    }
    
    public func parseUrl(_ url: URL?) -> Oauth2Response? {
        guard let url = url,
              url.absoluteString.contains(redirectURI),
              let components = URLComponents(string: url.absoluteString) else {
            print("A")
            return nil
        }
        // attempt to extract code and state from the url components
        guard let code = components.queryItems?.first(where: { $0.name == "code"})?.value,
              let state = components.queryItems?.first(where: { $0.name == "state"})?.value else {
            print("B")
            return nil
        }
        return Oauth2Response(code: code, state: state)
    }
    
    public func authorizeUser(oauthResponse: Oauth2Response) async throws {
        try await malService.authorizeUser(oauthResponse: oauthResponse)
    }
}
