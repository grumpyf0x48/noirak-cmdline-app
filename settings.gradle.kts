pluginManagement {
    val nativeImagePluginId: String by settings
    val nativeImagePluginVersion: String by settings

    repositories {
        mavenCentral()
        gradlePluginPortal()
    }

    plugins {
        id(nativeImagePluginId) version nativeImagePluginVersion
    }
}

rootProject.name = "command_line_quickstart"
