//
//  UserService.swift
//  UserService
//
//  Created by John Patrick Teruel on 4/24/23.
//

import Foundation
import AniListKtModule

public class UserService {
    let anilistService: AniListService
    
    public init (anilistService: AniListService) {
        self.anilistService = anilistService
    }
    
    public func getUserInfo() async throws -> UserInfo {
        return try await anilistService.getCurrentUser()
    }
}
