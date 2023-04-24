package com.pat.anilistkt

import com.russhwolf.settings.Settings

internal expect class Platform() {
    fun getSettings(): Settings
}
