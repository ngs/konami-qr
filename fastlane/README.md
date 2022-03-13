fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios set_build_number

```sh
[bundle exec] fastlane ios set_build_number
```

Set Build Number to GITHUB_RUN_ID

### ios release_match

```sh
[bundle exec] fastlane ios release_match
```

Match App Store Provisioning Profiles

### ios create_ci_keychain

```sh
[bundle exec] fastlane ios create_ci_keychain
```

Create keychain

### ios tests

```sh
[bundle exec] fastlane ios tests
```

Run tests

### ios release_build

```sh
[bundle exec] fastlane ios release_build
```

Build release

### ios testflight_upload

```sh
[bundle exec] fastlane ios testflight_upload
```

Publish app to TestFlight

### ios metadata

```sh
[bundle exec] fastlane ios metadata
```

Update App Store metadata

### ios screenshots

```sh
[bundle exec] fastlane ios screenshots
```

Update App Store screenshots

### ios match_all

```sh
[bundle exec] fastlane ios match_all
```

Match all

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
