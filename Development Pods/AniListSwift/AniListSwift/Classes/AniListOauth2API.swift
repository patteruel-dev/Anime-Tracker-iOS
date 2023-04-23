//
//  AniListOauth2API.swift
//  AniListSwift
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import Moya

enum AniListOauth2API: TargetType{
    case token(parameters: Oauth2TokenParameters)
}

extension AniListOauth2API {
    var baseURL: URL {
        try! "https://anilist.co/api/v2/oauth".asURL()
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
