package com.pat.anilistkt

import co.touchlab.kermit.Logger

fun String.logAndReturn(): String {
    Logger.d { this }
    return this
}
