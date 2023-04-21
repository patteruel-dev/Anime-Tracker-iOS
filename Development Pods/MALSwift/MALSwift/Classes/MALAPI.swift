//
//  MALAPI.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import Moya

enum MALAPI: TargetType {
    case anime(bearerToken: String)
    case animeDetails(animeId: String, bearerToken: String)
    case seasonalAnime(year: Int, season: String, bearerToken: String)
    case userAnimeList(userName: String, bearerToken: String)
}

extension MALAPI {
    var baseURL: URL {
        try! "https://api.myanimelist.net/v2".asURL()
    }
    var path: String {
        switch self {
        case .anime:
            return "anime"
        case .animeDetails(animeId: let animeId, _):
            return "anime/\(animeId)"
        case .seasonalAnime(year: let year, season: let season, _):
            return "anime/\(year)/\(season)"
        case .userAnimeList(userName: let userName, _):
            return "users/\(userName)/animelist"
        }
    }
    var method: Moya.Method {
        .get
    }
    var task: Moya.Task {
        .requestPlain
    }
    var headers: [String : String]? {
        switch self {
        case .anime(bearerToken: let bearerToken),
                .animeDetails(animeId: _, bearerToken: let bearerToken),
                .seasonalAnime(year: _, season: _, bearerToken: let bearerToken),
                .userAnimeList(userName: _, bearerToken: let bearerToken):
            return ["Authorization": "Bearer \(bearerToken)"]
        }
    }
}
