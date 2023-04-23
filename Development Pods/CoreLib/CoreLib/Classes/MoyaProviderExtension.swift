//
//  MoyaProviderExtension.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/23/23.
//

import Foundation
import Moya

public extension MoyaProvider {
    func request<T: Codable>(_ target: Target) async throws -> T {
        try await withCheckedThrowingContinuation { continuation in
            self.request(target, completion: { result in
                do {
                    let response = try result.get()
                    print("Response: \(response)")
                    let data = try response.map(T.self)
                    print("Data: \(data)")
                    continuation.resume(returning: data)
                } catch {
                    continuation.resume(throwing: error)
                }
            })
        }
    }
}
