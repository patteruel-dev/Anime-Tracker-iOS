plugins {
    // trick: for the same plugin versions in all sub-modules
    id("com.android.library").version("7.4.2").apply(false)
    kotlin("multiplatform").version("1.8.0").apply(false)
    id("org.jlleitschuh.gradle.ktlint") version "11.3.1"
}

allprojects {
    apply(plugin = "org.jlleitschuh.gradle.ktlint")
}

tasks.register("clean", Delete::class) {
    delete(rootProject.buildDir)
}
