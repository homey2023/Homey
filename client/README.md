Flutter app files

/android/app/src/main/AndroidManifest.xml은 따로 만들어주세요.

아래 복붙하시고, YOUR KEY HERE 부분에 google map API key 만들어서 넣어주시면 됩니당.

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.example.homey_client">
    <uses-permission android:name='android.permission.ACCESS_COARSE_LOCATION' />
    <uses-permission android:name='android.permission.ACCESS_FINE_LOCATION' />
   <application
        android:label="homey_client"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher">
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            <!-- Specifies an Android theme to apply to this Activity as soon as
                 the Android process has started. This theme is visible to the user
                 while the Flutter UI initializes. After that, this theme continues
                 to determine the Window background behind the Flutter UI. -->
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <!-- Don't delete the meta-data below.
             This is used by the Flutter tool to generate GeneratedPluginRegistrant.java -->
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
        <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>
    </application>
</manifest>

