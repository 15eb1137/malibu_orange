import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ads.freezed.dart';
// part 'ads.g.dart';

final adProvider = StateNotifierProvider<AdStateNotifier, AdState>(
    (ref) => AdStateNotifier()..init());

class AdStateNotifier extends StateNotifier<AdState> {
  AdStateNotifier() : super(const AdState(null));

  void init() => state = state.copyWith(
          bannerAd: BannerAd(
        size: AdSize.banner,
        adUnitId: bannerAdUnitId,
        listener: const BannerAdListener(),
        request: const AdRequest(),
      )..load());

  String get bannerAdUnitId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716';
    }

    if (Platform.isAndroid) {
      return 'ca-app-pub-8835706365570627/4432028709';
    } else if (Platform.isIOS) {
      throw UnsupportedError("Unsupported platform");
    } else {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
  }
}

@freezed
class AdState with _$AdState {
  const factory AdState(BannerAd? bannerAd) = _AdState;
}

class BannerAdWidget extends ConsumerWidget {
  const BannerAdWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final BannerAd bannerAd = ref.watch(adProvider).bannerAd!;
    return Container(
      height: 70,
      color: Colors.transparent,
      child: SizedBox(
        width: bannerAd.size.width.toDouble(),
        height: bannerAd.size.height.toDouble(),
        child: AdWidget(ad: bannerAd),
      ),
    );
  }
}
