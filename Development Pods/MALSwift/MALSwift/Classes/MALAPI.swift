//
//  MALAPI.swift
//  MALSwift
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import Moya

enum MALAPI: TargetType {
    case anime(authorization: String)
    case animeDetails(animeId: String, authorization: String)
    case seasonalAnime(year: Int, season: String, authorization: String)
    case userAnimeList(userName: String, authorization: String)
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
        switch self {
        default:
            return .get
        }
    }
    var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        switch self {
        case .anime(authorization: let authorization),
                .animeDetails(animeId: _, authorization: let authorization),
                .seasonalAnime(year: _, season: _, authorization: let authorization),
                .userAnimeList(userName: _, authorization: let authorization):
            return ["Authorization": authorization]
        default:
            return nil
        }
    }
}
