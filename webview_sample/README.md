# webview_sample

https://codelabs.developers.google.com/codelabs/flutter-webview?hl=ko#2


## 작업사항

webview_flutter => 4.0으로 변경했음.

- add plugin

```
flutter pub add webview_flutter
flutter pub add path_provider
```

```
  webview_flutter: ^4.4.2
  path_provider: ^2.1.1
```

- sdk version

`android/app/build.gradle`
```
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId "com.example.webview_in_flutter"
    minSdkVersion 20        // MODIFY
    targetSdkVersion 30
    versionCode flutterVersionCode.toInteger()
    versionName flutterVersionName
}

```

flutter.minSdkVersion
C:\dev\flutter\packages\flutter_tools\gradle\src\main\groovy


A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
