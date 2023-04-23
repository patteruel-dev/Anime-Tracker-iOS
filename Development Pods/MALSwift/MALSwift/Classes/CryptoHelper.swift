//
//  CryptoHelper.swift
//  CoreLib
//
//  Created by John Patrick Teruel on 4/22/23.
//

import Foundation
import CryptoKit

class CryptoHelper {
    static func generatePKCEToken() -> String {
        let codeVerifier = generateCodeVerifier()
        let codeChallenge = generateCodeChallenge(codeVerifier: codeVerifier)
        return codeChallenge
    }

    private static func generateCodeVerifier() -> String {
        let randomBytes = generateRandomBytes(count: 69)
        let res = randomBytes.base64EncodedString()
        return base64URLEncode(str: res)
    }

    private static func generateCodeChallenge(codeVerifier: String) -> String {
        let hash = sha256Hash(raw: codeVerifier)
        let res = hash.base64EncodedString()
        return base64URLEncode(str: res)
    }

    private static func generateRandomBytes(count: Int) -> Data {
        var randomBytes = Data(count: count)
        let result = randomBytes.withUnsafeMutableBytes {
            SecRandomCopyBytes(kSecRandomDefault, count, $0.baseAddress!)
        }
        assert(result == errSecSuccess, "Failed to get random bytes")
        return randomBytes
    }

    private static func sha256Hash(raw: String) -> Data {
        let data = raw.data(using: .utf8)!
        let sha256 = SHA256.hash(data: data)
        return Data(sha256)
    }
    
    private static func base64URLEncode(str: String) -> String {
        return str
            .replacingOccurrences(of: "+", with: "-")
            .replacingOccurrences(of: "/", with: "_")
            .replacingOccurrences(of: "=", with: "")
    }
}

/*
function generatePKCETokenUsingCryptoJS() {
  const codeVerifier = generateCodeVerifierUsingCryptoJS();
  const codeChallenge = generateCodeChallengeUsingCryptoJS(codeVerifier);
  return { codeVerifier, codeChallenge };
}

function generateCodeVerifierUsingCryptoJS() {
  const randomBytes = CryptoJS.lib.WordArray.random(69);
  const res = CryptoJS.enc.Base64.stringify(randomBytes);
  return base64URLEncode(res);
}

function generateCodeChallengeUsingCryptoJS(codeVerifier) {
    const hash = CryptoJS.SHA256(codeVerifier);
    const res =  CryptoJS.enc.Base64.stringify(hash);
  return base64URLEncode(res);
}

function base64URLEncode(str) {
    return str.toString('base64')
        .replace(/\+/g, '-')
        .replace(/\//g, '_')
        .replace(/=/g, '');
}
*/
