package com.pat.anilistkt

import com.apollographql.apollo3.ApolloClient
import com.pat.anilistkt.fragment.MediaPage
import com.pat.anilistkt.fragment.UserInfo

class AniListService(
    val clientId: String,
    val clientSecret: String,
    val redirectURI: String
) {
    private var session: AniListSession? = null
    private val currentSession: AniListSession
        get() = session ?: throw IllegalStateException("Session not initialized")
    private val client: ApolloClient
        get() = currentSession.client

    fun oauth2URL(): String {
        return "https://anilist.co/api/v2/oauth/authorize?response_type=token&client_id=$clientId"
    }

    fun parseToken(url: String): OAuthToken? {
        // check if URL contains access_token, token_type, and expires_in
        if (!url.contains("access_token") || !url.contains("token_type") || !url.contains("expires_in")) {
            return null
        }

        // get access_token, token_type, and expires_in from URL
        val accessToken = url.substringAfter("access_token=").substringBefore("&")
        val tokenType = url.substringAfter("token_type=").substringBefore("&")
        val expiresIn = url.substringAfter("expires_in=").substringBefore("&").toInt()
        return OAuthToken(accessToken = accessToken, tokenType = tokenType, expiresIn = expiresIn)
    }

    fun authorizeUser(token: OAuthToken) {
        this.session = AniListSession(token = token)
    }

    @Throws(Throwable::class)
    suspend fun getCurrentUser(): UserInfo = this.currentSession.getCurrentUser()

    suspend fun getCurrentlyWatched(): MediaPage {
        val userInfo = this.currentSession.getCurrentUser()
        val query = UserMediaListQuery(userInfo.id)
        return this.client.executeQuery(query).Page?.mediaPage ?: throw IllegalStateException("No media found")
    }
}
