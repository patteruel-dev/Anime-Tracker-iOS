//
//  MALService.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import Moya

public class MALService {
    let provider: MoyaProvider<MALAPI>
    let clientId = "d62be5708aceb1d03e507dd24538cf91"
    
    public init () {
        provider = MoyaProvider<MALAPI>()
    }
    
    public func oauth2URL() -> URL {
        /*
         https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=d62be5708aceb1d03e507dd24538cf91&state=9b416493-c5b6-4aa9-943a-43222c412b2a&code_challenge=xnRXAql04G9skfkgPDdp0I9n4js8NKBAzJl9VswPryRe210nUXWi-rKHXXGp83FQmwZhbKacnpGy8ddYU3NIWqMhfR1Y
         */
        let pkceToken = CryptoHelper.generatePKCEToken()
        let state = UUID().uuidString
        let urlRaw = "https://myanimelist.net/v1/oauth2/authorize?response_type=code&client_id=\(clientId)&state=\(state)&code_challenge=\(pkceToken)"
        return try! urlRaw.asURL()
    }
}
