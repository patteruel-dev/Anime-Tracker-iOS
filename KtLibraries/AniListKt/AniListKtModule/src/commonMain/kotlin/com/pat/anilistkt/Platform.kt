package com.pat.anilistkt

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform