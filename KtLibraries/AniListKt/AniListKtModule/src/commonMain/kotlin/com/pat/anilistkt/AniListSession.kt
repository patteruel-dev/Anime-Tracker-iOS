package com.pat.anilistkt

import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.api.http.HttpHeader
import com.apollographql.apollo3.api.http.HttpMethod
import com.pat.anilistkt.fragment.UserInfo

internal class AniListSession(
    val token: OAuthToken
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
}
