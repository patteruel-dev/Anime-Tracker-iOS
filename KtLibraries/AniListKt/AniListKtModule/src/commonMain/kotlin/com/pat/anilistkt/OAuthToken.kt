package com.pat.anilistkt

@kotlinx.serialization.Serializable
data class OAuthToken(
    val tokenType: String,
    val expiresIn: Int,
    val accessToken: String
) {
    fun fetchAuthorizationHeader(): String {
        return "$tokenType $accessToken"
    }
}
