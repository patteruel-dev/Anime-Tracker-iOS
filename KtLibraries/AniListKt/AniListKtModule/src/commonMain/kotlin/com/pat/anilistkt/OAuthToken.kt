package com.pat.anilistkt

data class OAuthToken(
    val tokenType: String,
    val expiresIn: Int,
    val accessToken: String
) {
    fun getAuthorizationHeader(): String {
        return "$tokenType $accessToken"
    }
}
