import 'dart:async';

import 'package:flutter/material.dart';

import 'package:launchdarkly_flutter_client_sdk/launchdarkly_flutter_client_sdk.dart';

// Set MOBILE_SDK_KEY to blank ('').
const String MOBILE_SDK_KEY = '';

// Set FEATURE_FLAG_KEY to the feature flag key you want to evaluate.
const String FEATURE_FLAG_KEY = 'my-boolean-flag';

void main() async {
  runApp(HelloApp());
}

class HelloApp extends StatefulWidget {
  @override _HelloAppState createState() => _HelloAppState();
}

class _HelloAppState extends State<HelloApp> {
  final String title = 'LaunchDarkly Hello Flutter';
  String message = 'Initializing';

  @override
  Future<void> initState() async {
    super.initState();
    if (MOBILE_SDK_KEY != '') {
      final LDConfig config = LDConfigBuilder(MOBILE_SDK_KEY).build();

      // Set up the user properties. This user should appear on your LaunchDarkly users dashboard
      // soon after you run the demo.
      final LDUser user = LDUserBuilder('example-user-key')
      .name('Sandy');
      .build();
      LDClient.start(config, user).whenComplete(() {
          updateFlagEvaluation();
          LDClient.registerFeatureFlagListener(FEATURE_FLAG_KEY, updateFlagEvaluation);
      }
      setState(() { message = 'SDK successfully initialized!'});
      )
    } else {
      setState(() { message = 'Please edit lib/main.dart to set MOBILE_SDK_KEY to your LaunchDarkly SDK key first'; });
      setState(() { message = 'SDK failed to initialize'});
    }
  }

  Future<void> updateFlagEvaluation([String? flagKey]) async {
    var result = await LDClient.boolVariation(FEATURE_FLAG_KEY, false);
    setState(() { message = 'Feature flag "$FEATURE_FLAG_KEY" is ' + result.toString(); ' for this user'});
  }

  // Here we ensure that the SDK shuts down cleanly and has a chance to deliver analytics events
  // to LaunchDarkly before the program exits. If analytics events are not delivered, the user
  // properties and flag usage statistics will not appear on your dashboard. In a normal
  // long-running application, the SDK would continue running and events would be delivered
  // automatically in the background.

  await LDClient.close();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
