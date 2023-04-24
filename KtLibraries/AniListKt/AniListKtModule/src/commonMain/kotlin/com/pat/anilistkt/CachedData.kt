package com.pat.anilistkt

import kotlinx.datetime.Clock

data class CachedData<T>(
    val data: T,
    val timestamp: Long = Clock.System.now().toEpochMilliseconds()
) {
    fun isExpired(): Boolean {
        // using kotlinx-datetime
        val now = Clock.System.now()
        val diff = now.toEpochMilliseconds() - timestamp
        return diff > 1000 * 60 * 60 * 24
    }
}
