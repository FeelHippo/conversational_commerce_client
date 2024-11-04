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
        <li><a href="#fastlane-integration">Fastlane integration</a></li>
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