//
//  MALOauth2API.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import Moya

enum MALOauth2API: TargetType{
    case token(parameters: Oauth2TokenParameters)
}

extension MALOauth2API {
    var baseURL: URL {
        try! "https://myanimelist.net/v1/oauth2".asURL()
    }
    
    var path: String {
        switch self {
        case .token:
            return "token"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .token:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
            case .token(parameters: let parameters):
                return .requestParameters(parameters: parameters.unsafeAsDictionary(), encoding: URLEncoding.httpBody)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return nil
        }
    }
}
