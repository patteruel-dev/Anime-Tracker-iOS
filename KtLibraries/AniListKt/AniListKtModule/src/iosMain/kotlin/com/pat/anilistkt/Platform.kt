package com.pat.anilistkt

import com.russhwolf.settings.NSUserDefaultsSettings
import com.russhwolf.settings.Settings
import platform.Foundation.NSUserDefaults

internal actual class Platform actual constructor() {
    private val delegate = NSUserDefaults()
    actual fun getSettings(): Settings = NSUserDefaultsSettings(delegate)
}
