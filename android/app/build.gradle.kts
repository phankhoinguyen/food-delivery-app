import java.util.Properties
import java.io.FileInputStream

plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}

// Load environment variables from .env file
val envProperties = Properties()
val envFile = rootProject.file(".env")
if (envFile.exists()) {
    envProperties.load(FileInputStream(envFile))
} else {
    println("Warning: .env file not found. Please create .env file with GOOGLE_MAPS_API_KEY")
}

android {
    namespace = "com.example.food_delivery"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"
    

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.food_delivery"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName

        // Set manifestPlaceholders with API key from .env
        manifestPlaceholders["googleMapsApiKey"] = envProperties.getProperty("GOOGLE_MAPS_API_KEY") ?: ""
        
        // Log warning if API key is missing
        val apiKey = envProperties.getProperty("GOOGLE_MAPS_API_KEY")
        if (apiKey.isNullOrEmpty()) {
            println("Warning: GOOGLE_MAPS_API_KEY not found in .env file")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
