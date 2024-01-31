# LaunchDarkly Sample Flutter Application

> [!WARNING]
> This repository has been superseded by by an [example](https://github.com/launchdarkly/flutter-client-sdk/tree/main/packages/flutter_client_sdk/example) within the SDK repository.

We've built a simple Flutter application that demonstrates how LaunchDarkly's SDK works.

Below, you'll find the basic build procedure, but for more comprehensive instructions, you can visit the [Flutter SDK reference guide](https://docs.launchdarkly.com/sdk/client-side/flutter).

## Build instructions

1. Make sure you have [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.

2. Edit `lib/main.dart` and set the value of `MOBILE_SDK_KEY` to your LaunchDarkly mobile key. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set `FEATURE_FLAG_KEY` to the flag key.

3. Open an iOS simulator instance, Android emulator instance, or connect a physical device to run the application on.

4. On the command line, run `flutter run` to start the application on the device.

5. The application will show the value of the flag `FEATURE_FLAG_KEY` in the UI.
