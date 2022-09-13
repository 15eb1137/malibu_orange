import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

part 'ads.freezed.dart';
// part 'ads.g.dart';

final adProvider =
    StateNotifierProvider<AppOpenAdStateNotifier, AppOpenAdState>((ref) {
  final ad = AppOpenAdStateNotifier()..loadAd();
  WidgetsBinding.instance.addObserver(AppLifecycleReactor(ad: ad));
  return ad;
});

class AppOpenAdStateNotifier extends StateNotifier<AppOpenAdState> {
  AppOpenAdStateNotifier()
      : super(const AppOpenAdState(appOpenAd: null, appOpenLoadTime: null));

  void loadAd() {
    AppOpenAd.load(
      adUnitId: adUnitId,
      orientation: AppOpenAd.orientationPortrait,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('Ad loaded.');
          state =
              state.copyWith(appOpenAd: ad, appOpenLoadTime: DateTime.now());
        },
        onAdFailedToLoad: (error) {
          debugPrint('AppOpenAd failed to load: ${error.toString()}');
        },
      ),
    );
  }

  void showAdIfAvailable() {
    if (!isAdAvailable) {
      debugPrint('Tried to show ad before available.');
      loadAd();
      return;
    }
    if (state.isShowingAd) {
      debugPrint('Tried to show ad while already showing an ad.');
      return;
    }
    if (DateTime.now()
        .subtract(state.maxCacheDuration)
        .isAfter(state.appOpenLoadTime!)) {
      debugPrint('Maximum cache duration exceeded. Loading another ad.');
      state.appOpenAd!.dispose();
      state = state.copyWith(appOpenAd: null);
      loadAd();
      return;
    }
    // Set the fullScreenContentCallback and show the ad.
    state.appOpenAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (ad) {
        state = state.copyWith(isShowingAd: true);
        debugPrint('$ad onAdShowedFullScreenContent');
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        debugPrint('$ad onAdFailedToShowFullScreenContent: $error');
        state = state.copyWith(isShowingAd: false);
        ad.dispose();
        state = state.copyWith(appOpenAd: null);
      },
      onAdDismissedFullScreenContent: (ad) {
        debugPrint('$ad onAdDismissedFullScreenContent');
        state = state.copyWith(isShowingAd: false);
        ad.dispose();
        state = state.copyWith(appOpenAd: null);
        loadAd();
      },
    );
  }

  bool get isAdAvailable {
    return state.appOpenAd != null;
  }

  String get adUnitId {
    if (kDebugMode) {
      return Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/3419835294'
          : 'ca-app-pub-3940256099942544/5662855259';
    }

    if (Platform.isAndroid) {
      return 'ca-app-pub-';
    } else if (Platform.isIOS) {
      throw UnsupportedError("Unsupported platform");
    } else {
      return 'ca-app-pub-3940256099942544/3419835294';
    }
  }
}

@freezed
class AppOpenAdState with _$AppOpenAdState {
  const factory AppOpenAdState(
      {@Default(false) bool isShowingAd,
      @Default(Duration(hours: 4)) Duration maxCacheDuration,
      DateTime? appOpenLoadTime,
      AppOpenAd? appOpenAd}) = _AppOpenAdState;
}

class AppLifecycleReactor extends WidgetsBindingObserver {
  final AppOpenAdStateNotifier ad;

  AppLifecycleReactor({required this.ad});

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      ad.showAdIfAvailable();
    }
  }
}
