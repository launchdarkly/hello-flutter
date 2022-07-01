# LaunchDarkly sample Flutter application

We've built a simple Flutter application that demonstrates how LaunchDarkly's SDK works.

Below, you'll find the build procedure. For more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/) or the [Flutter SDK reference guide](https://docs.launchdarkly.com/sdk/client-side/flutter).

## Build instructions

1. Edit `lib/main.dart` and set the value of `MOBILE_SDK_KEY` to your LaunchDarkly mobile key. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set `FEATURE_FLAG_KEY` to the flag key.

2. On the command line, run `flutter run`.

3. You should receive the message "Feature flag '<FEATURE_FLAG_KEY>' is '<true/false>' for this user."
