import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../app.dart';

void main() async {
  if (!kIsWeb) _setTargetPlatformForDesktop();
  // debugPaintSizeEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  await _setOptionalFeatures();
  return runApp(const ProviderScope(child: AppLoading()));
}

class AppLoading extends ConsumerWidget {
  const AppLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading =
        ref.watch(appModelProvider.select((model) => model.router)) == null;
    return isLoading ? Container(color: const Color(0xFFfce897)) : const App();
  }
}

void _setTargetPlatformForDesktop() {
  TargetPlatform? targetPlatform;
  if (Platform.isMacOS) {
    targetPlatform = TargetPlatform.iOS;
  } else if (Platform.isLinux || Platform.isWindows) {
    targetPlatform = TargetPlatform.android;
  }
  if (targetPlatform != null) {
    debugDefaultTargetPlatformOverride = targetPlatform;
  }
}

Future<void> _setOptionalFeatures() async {
  await MobileAds.instance.initialize();
  // if (!kDebugMode) {
  //   await Firebase.initializeApp(
  //     options: DefaultFirebaseOptions.currentPlatform,
  //   );
  // } else {
  //   await Firebase.initializeApp(
  //     options: firebase_options_dev.DefaultFirebaseOptions.currentPlatform,
  //   );
  // }
  // await Purchases.setDebugLogsEnabled(true);
  // if (Platform.isAndroid) {
  //   await Purchases.setup("goog_cTiatAWufSELHXRFGJsvTQWuYtV");
  // }
  // else if (Platform.isIOS) {
  //   await Purchases.setup("public_ios_sdk_key");
  // }
}
