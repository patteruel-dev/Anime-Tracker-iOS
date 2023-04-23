//
//  AniListService.swift
//  AniListSwift
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import Moya
import CoreLib

public class AniListService {
    let oauthProvider: MoyaProvider<AniListOauth2API>
    
    let clientId = "12311"
    let clientSecret = "J8SBs6FN6D4YxeJYeik8Vp2x1oxtAolaKV2r5Q69"
    
    var session: AniListSession?
    
    public init () {
        // initialize provider with curl logging plugin
        let plugins = [
            NetworkLoggerPlugin(
                configuration: .init(
                    logOptions: [.formatRequestAscURL, .successResponseBody, .errorResponseBody]
                )
            )
        ]
        
        oauthProvider = MoyaProvider<AniListOauth2API>(
            plugins: plugins
        )
    }
    
    public func oauth2URL(state: String) -> URL {
        let urlRaw = "https://anilist.co/api/v2/oauth/authorize?response_type=token&client_id=\(clientId)"
        return try! urlRaw.asURL()
    }
    
    public func authorizeUser(oauthResponse: Oauth2Response) async throws {
        self.session = AniListSession(token: oauthResponse)
    }
}
