# form_view

A new Flutter project.


1 - Add this lines in project : 

- Andoridmanifest.xml :
   android:enableOnBackInvokedCallback="true"

 2 -  android\app\build.gradel :

    plugins {
    id 'com.google.gms.google-services'
    }
    
   dependencies{
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlin_version"    
    implementation platform('com.google.firebase:firebase-bom:33.1.2')
    implementation 'com.google.firebase:firebase-analytics'
    implementation 'com.google.android.gms:play-services-vision:20.1.3'
   }

3 - android\build.gradel : 

 buildscript {
    ext.kotlin_version = '2.0.0'
    repositories {
        google()
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:7.2.0'
        classpath "org.jetbrains.kotlin:kotlin-gradle-plugin:$kotlin_version"
        classpath 'com.google.gms:google-services:4.3.13'
        
    }
}
}

4- android\setting.gradel 

 -     id "org.jetbrains.kotlin.android" version "2.0.0" apply false

   
