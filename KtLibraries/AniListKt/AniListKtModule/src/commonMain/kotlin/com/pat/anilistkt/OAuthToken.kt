package com.pat.anilistkt

@kotlinx.serialization.Serializable
data class OAuthToken(
    val tokenType: String,
    val expiresIn: Int,
    val accessToken: String
) {
    fun getAuthorizationHeader(): String {
        return "$tokenType $accessToken"
    }
}
