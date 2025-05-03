# flutter\_dynamic\_app\_icons

A Flutter plugin to dynamically change your app's launcher icon **at runtime** — on both **Android** and **iOS** platforms.

---

## ✨ Features

* Change app icon dynamically on **iOS 10.3+** using alternate icons
* Change app icon dynamically on **Android** using `activity-alias`
* Works without any third-party plugin dependencies

---

## 📁 Installing

Add this to your `pubspec.yaml`:

```yaml
flutter_dynamic_app_icons:
  git:
    url: https://github.com/Ujjwal091/dynamic_app_icons.git
```

---

## ⚡ Usage

```dart
import 'package:flutter_dynamic_app_icons/flutter_dynamic_app_icons.dart';

// Change to alternate icon
await FlutterDynamicAppIcons.setIcon("IconDark");

// Reset to default icon
await FlutterDynamicAppIcons.setIcon(null);
```

---

## 🚀 Getting Started

To see a working example:

```bash
cd example
flutter run
```

---

## 📲 Android Integration

### 1. Add Icons

Place your icon files in all mipmap folders:

```
android/app/src/main/res/mipmap-xxxhdpi/icon_dark.png
android/app/src/main/res/mipmap-xxxhdpi/icon_alt.png
```

### 2. Update `AndroidManifest.xml`

Inside the `<application>` tag, add your aliases:

```xml
<activity
    android:name=".MainActivity"
    android:launchMode="singleTop"
    android:exported="true"
    android:theme="@style/LaunchTheme"
    android:windowSoftInputMode="adjustResize">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity>

<activity-alias
    android:name=".IconDarkAlias"
    android:enabled="false"
    android:exported="true"
    android:icon="@mipmap/icon_dark"
    android:label="@string/app_name"
    android:targetActivity=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity-alias>

<activity-alias
    android:name=".IconAltAlias"
    android:enabled="false"
    android:exported="true"
    android:icon="@mipmap/icon_alt"
    android:label="@string/app_name"
    android:targetActivity=".MainActivity">
    <intent-filter>
        <action android:name="android.intent.action.MAIN" />
        <category android:name="android.intent.category.LAUNCHER" />
    </intent-filter>
</activity-alias>
```

> **Note:** On some Android versions (like Android 8+), the icon change may take a few seconds to reflect.

### 3. Known Android Issues

* Some launchers may not support icon alias switching.
* Avoid splash screen metadata in aliases:

```xml
<meta-data
    android:name="io.flutter.embedding.android.SplashScreenDrawable"
    android:resource="@drawable/launch_background" />
```

---

## 🌐 iOS Integration

### 1. Add Icons Outside Assets

Inside your `ios/Runner/` project:

* Create a folder named `App Icons`
* Add icons like:

    * `icon_dark@2x.png`, `icon_dark@3x.png`
    * `icon_alt@2x.png`, `icon_alt@3x.png`

**Don't** place them inside `Assets.xcassets`, or Xcode will throw a build error.
When adding to Xcode, use **"Create Folder References"**.

### 2. Update `Info.plist`

```xml
<key>CFBundleIcons</key>
<dict>
  <key>CFBundlePrimaryIcon</key>
  <dict>
    <key>CFBundleIconFiles</key>
    <array>
      <string>AppIcon</string>
    </array>
    <key>UIPrerenderedIcon</key>
    <false/>
  </dict>
  <key>CFBundleAlternateIcons</key>
  <dict>
    <key>IconDark</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>icon_dark</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
    <key>IconAlt</key>
    <dict>
      <key>CFBundleIconFiles</key>
      <array>
        <string>icon_alt</string>
      </array>
      <key>UIPrerenderedIcon</key>
      <false/>
    </dict>
  </dict>
</dict>
```

### 3. iOS Limitations

* Works only on iOS 10.3 and above.
* iOS may show a confirmation pop-up the first time.
* App must be **not running in background** when icon is switched (iOS caches home screen).

---

## ✅ Supported Platforms

| Platform | Supported | Notes                           |
| -------- | --------- | ------------------------------- |
| Android  | ✅         | Works with `activity-alias`     |
| iOS      | ✅         | iOS 10.3+, alternate icons only |
| macOS    | ❌         | Not supported                   |
| Windows  | ❌         | Not supported                   |

---

## ✨ Contributions

Pull requests are welcome! Let's improve cross-platform support together.

---

## 📊 Versioning

Check `CHANGELOG.md` for release notes.

---

## ⭐ Example UI

In the `example/` app, you'll find 3 buttons:

* Set Icon: Dark
* Set Icon: Alt
* Reset to Default

Use this to test switching behavior on real devices.

---

## License

MIT
