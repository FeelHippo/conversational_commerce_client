# stadtplan_mobile_app
[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ul>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#setup">Setup</a></li>
        <li><a href="#flutter-sdk-version">Flutter SDK Version</a></li>
        <li><a href="#firebase-sdk">Firebase SDK</a></li>
        <li><a href="#google-maps-api">Google Maps API</a></li>
      </ul>
    </li>
  </ul>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

TODO: add description here

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SETUP -->
### Setup
You must have [git-crypt](https://github.com/AGWA/git-crypt) installed and be added as a git-crypt user to decrypt the necessary files to prepare the project. See guide [here](https://medium.com/@sumitkum/securing-your-secret-keys-with-git-crypt-b2fa6ffed1a6)

To decrypt the files using git-crypt, run:
```shell
git-crypt unlock
```

To prepare the project and compile all necessary files, run:
```shell
flutter pub run build_runner build --delete-conflicting-outputs
```

To build the "packages" folder, run:
```shell
cd packages\api_client
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

TODO: alternatively, the following can be used in a git hook to automatise this process
```shell
#!/bin/sh
exec flutter pub run build_runner build --delete-conflicting-outputs
```
This command can be run on every `git pull` automatically, from the following hooks:
- post-merge
- post-checkout

How to handle unwanted .gitignored files
```shell
# See the unwanted files:
git ls-files -ci --exclude-standard

# Remove the unwanted files: 
git ls-files -ci --exclude-standard -z | xargs -0 git rm --cached

# Commit changes
git commit -am "Removed unwanted files marked in .gitignore"

# Push
git push # or whatever branch you're on
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FLUTTER SDK VERSION -->
### Flutter SDK Version
It is reccomended to use [Simple Flutter Version Manager](https://fvm.app/) when running this project.
When you first run this project, you should first execute `fvm use <FLUTTER_SDK_VERSION>`
This project is being developed on 3.24.4 for the time being.

<!-- FIREBASE -->
### Firebase SDK
Firebase configuration file lib/firebase_options.dart is generated as follows:
[Documentation](https://firebase.google.com/docs/flutter/setup?platform=ios)
- automate firebase_options.dart fetch in CI:
    - dart pub global activate flutterfire_cli
    - export PATH="$PATH":"$HOME/.pub-cache/bin"
    - url -sL https://firebase.tools | bash
    - firebase login
    - flutterfire configure
- to see all available apps for a project: `firebase apps:list --project stadtplan-app`
- to get `google-services.json` via the CLI: `firebase apps:sdkconfig --project stadtplan-app`
    - select `stadtplan-app (android) - ... (ANDROID)`
    - this will create a new `./android/app/google-services.json`
- iOs:
    - download the `GoogleService-Info.plist` file from Firebase
    - drag and drop the file directly into xCode (it will not work if dropped into Android Studio or VS Code)

To sync the project dependencies:
- make sure your local JDK is at least 17: `java -version`, else [set it up](https://docs.oracle.com/cd/E19182-01/820-7851/inst_cli_jdk_javahome_t/)
- set up Gradle in Android Studio:
    - `where gradle` will show you the path to gradle, e.g. `/opt/homebrew/bin/gradle`
    - copy `/opt/homebrew/bin`
    - go to Android Studio => Settings => Build, Execution, Deployment => Gradle => General Settings
    - replace whatever path you see in "Gradle user home" with the above
    - File => New => Import Project => import project's Android folder
    - File => [Sync Project](https://developer.android.com/build#sync-files)
    - in case of conflicts between Gradle dependencies, make sure the [dependencies](https://github.com/Springworks/as-charging-app/blob/main/android/build.gradle) have compatible versions
- build xCode project:
    - from the root of the charging app folder: `cd ios | pod install | cd ..`
    - from the terminal, run `flutter build ios --flavor <FLAVOR_NAME_HERE>` to make sure everything is fine

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GOOGLE MAPS API -->
### Google Maps API
[Here](https://developers.google.com/maps/flutter-package/config) you will find documentation.
[Google API Key](https://console.cloud.google.com/apis/credentials/key/62c6396e-3985-4aad-9dd4-c9a92151f1c6?project=model-arcadia-440721-k3) is encrypted in AppDelegate.swift and AndroidManifest.xml for iOs and Android respectively.
Download `google-services.json` and `GoogleService-Info.plist` files again, build xCode project, Sync Android project

<p align="right">(<a href="#readme-top">back to top</a>)</p>