package com.pat.anilistkt

import com.apollographql.apollo3.ApolloClient
import com.apollographql.apollo3.api.Query

object GraphQLHelper

suspend fun <D : Query.Data> ApolloClient.executeQuery(query: Query<D>): D {
    val result = this.query(query).execute()
    if (result.hasErrors()) {
        val message = result.errors?.firstOrNull()?.message ?: "Unknown error"
        throw IllegalStateException(message)
    }
    return result.data ?: throw IllegalStateException("No data")
}
