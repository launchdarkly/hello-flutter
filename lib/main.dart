import 'dart:async';

import 'package:flutter/material.dart';

import 'package:launchdarkly_flutter_client_sdk/launchdarkly_flutter_client_sdk.dart';

const String MOBILE_SDK_KEY = '';
const String FEATURE_FLAG_KEY = 'YOUR_FEATURE_KEY';

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
  void initState() {
    super.initState();
    if (MOBILE_SDK_KEY != '') {
      final LDConfig config = LDConfigBuilder(MOBILE_SDK_KEY).build();

      final LDContextBuilder builder = LDContextBuilder();
      builder.kind('user', 'user-key-123abc');
      final LDContext context = builder.build();

      // --- Another example context showing more customization ---
      // LDContextBuilder builder = LDContextBuilder();
      // builder.kind('user', 'user-key-123abc')
      //     .set('email', userEmail)
      //     .privateAttributes(['email']);
      // builder.kind('device')
      //     .set('os', LDValue.ofString(systemOS))
      //     .set('device', LDValue.ofString(deviceName));
      // LDContext context = builder.build();
      // --- End example ---

      LDClient.startWithContext(config, context).whenComplete(() {
          updateFlagEvaluation();
          LDClient.registerFeatureFlagListener(FEATURE_FLAG_KEY, updateFlagEvaluation);
      });
    } else {
      setState(() { message = 'MOBILE_SDK_KEY not set'; });
    }
  }

  Future<void> updateFlagEvaluation([String? flagKey]) async {
    var result = await LDClient.boolVariation(FEATURE_FLAG_KEY, false);
    setState(() { message = 'Feature "$FEATURE_FLAG_KEY" evaluated to ' + result.toString(); });
  }

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
