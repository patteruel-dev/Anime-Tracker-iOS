//
//  MALService.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import Moya
import CoreLib

public class MALService {
    let provider: MoyaProvider<MALAPI>
    let oauthProvider: MoyaProvider<MALOauth2API>
    
    let clientId = "5762354fb04d5f91bdcd55bc8df0a882"
    let clientSecret = "22310fa1c490def9f6221668fe7c5b831e42675fb853d272102221e60be41fc9"
    
    lazy var pkceToken: String = CryptoHelper.generatePKCEToken()
    var session: MALSession?
    
    public init () {
        // initialize provider with curl logging plugin
        let plugins = [
            NetworkLoggerPlugin(
                configuration: .init(
                    logOptions: [.formatRequestAscURL, .successResponseBody, .errorResponseBody]
                )
            )
        ]
        
        provider = MoyaProvider<MALAPI>(
            plugins: plugins
        )
        
        oauthProvider = MoyaProvider<MALOauth2API>(
            plugins: plugins
        )
    }
    
    public func oauth2URL(state: String) -> URL {
        let urlRaw = "https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=\(clientId)&state=\(state)&code_challenge=\(pkceToken)"
        return try! urlRaw.asURL()
    }
    
    public func authorizeUser(oauthResponse: Oauth2Response) async throws {
        let parameters = Oauth2TokenParameters(clientId: clientId, clientSecret: clientSecret, code: oauthResponse.code, codeVerifier: pkceToken, grantType: "authorization_code")
        let token: Oauth2TokenResponse = try await oauthProvider.request(.token(parameters: parameters))
        self.session = MALSession(token: token)
    }
}
