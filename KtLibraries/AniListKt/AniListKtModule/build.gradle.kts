plugins {
    kotlin("multiplatform")
    kotlin("native.cocoapods")
    id("com.android.library")
    id("com.apollographql.apollo3") version "3.7.3"
}

kotlin {
    android {
        compilations.all {
            kotlinOptions {
                jvmTarget = "1.8"
            }
        }
    }
    iosX64()
    iosArm64()
    iosSimulatorArm64()

    cocoapods {
        summary = "Some description for the Shared Module"
        homepage = "Link to the Shared Module homepage"
        version = "1.0"
        ios.deploymentTarget = "14.1"
        framework {
            baseName = "AniListKtModule"
        }
    }

    sourceSets {
        val commonMain by getting {
            dependencies {
                implementation("com.apollographql.apollo3:apollo-runtime:3.7.3")
                api("org.jetbrains.kotlinx:kotlinx-datetime:0.4.0")
                api("co.touchlab:kermit:1.2.2")
            }
        }
        val commonTest by getting {
            dependencies {
                implementation(kotlin("test"))
            }
        }
        val androidMain by getting
        val androidUnitTest by getting
        val iosX64Main by getting
        val iosArm64Main by getting
        val iosSimulatorArm64Main by getting
        val iosMain by creating {
            dependsOn(commonMain)
            iosX64Main.dependsOn(this)
            iosArm64Main.dependsOn(this)
            iosSimulatorArm64Main.dependsOn(this)
        }
        val iosX64Test by getting
        val iosArm64Test by getting
        val iosSimulatorArm64Test by getting
        val iosTest by creating {
            dependsOn(commonTest)
            iosX64Test.dependsOn(this)
            iosArm64Test.dependsOn(this)
            iosSimulatorArm64Test.dependsOn(this)
        }
    }
}

android {
    namespace = "com.pat.anilistkt"
    compileSdk = 33
    defaultConfig {
        minSdk = 29
        targetSdk = 33
    }
}

apollo {
    service("service") {
        packageName.set("com.pat.anilistkt")
    }
}

ktlint {
    enableExperimentalRules.set(true)
    filter {
        exclude {
            val path = projectDir.toURI().relativize(it.file.toURI()).path
            path.contains("/generated/")
        }
    }
}
