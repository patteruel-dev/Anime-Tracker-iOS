package com.pat.anilistkt

import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.api.http.HttpHeader
import com.apollographql.apollo3.api.http.HttpMethod
import com.pat.anilistkt.fragment.UserInfo
import com.russhwolf.settings.Settings
import kotlinx.serialization.decodeFromString
import kotlinx.serialization.json.Json

internal class AniListSession(
    val token: OAuthToken,
    val json: Json,
    val settings: Settings
) {
    val client: ApolloClient = ApolloClient.Builder()
        .serverUrl("https://graphql.anilist.co")
        .httpMethod(HttpMethod.Post)
        .httpHeaders(
            listOf(
                HttpHeader("Authorization", token.getAuthorizationHeader())
            )
        )
        .build()

    fun saveSession() {
        val encoded = json.encodeToString(OAuthToken.serializer(), token)
        settings.putString(Constants.oAuthToken, encoded)
    }

    var cachedUser: CachedData<UserInfo>? = null
    suspend fun getCurrentUser(): UserInfo {
        // cached
        cachedUser?.let {
            if (!it.isExpired()) {
                return it.data
            }
        }

        val query = CurrentUserQuery()
        val userInfo = client.executeQuery(query).Viewer?.userInfo ?: throw IllegalStateException("No user found")
        cachedUser = CachedData(userInfo)
        return userInfo
    }

    companion object {
        fun loadSession(json: Json, settings: Settings): AniListSession? {
            val encoded = settings.getString(Constants.oAuthToken, "")
            if (encoded.isEmpty()) {
                return null
            }
            val token: OAuthToken = json.decodeFromString(encoded)
            return AniListSession(token, json, settings)
        }
    }
}
