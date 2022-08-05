import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:malibu_orange/app.dart';
import 'package:malibu_orange/main.dart';
import 'package:malibu_orange/pages/brightness.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class TestData {}

class BrightnessModelTestData implements TestData {
  ProviderContainer prepareDependency(
      {Stream<double?> brightnessStream = const Stream.empty(),
      Future<bool?>? isBrightnessSensorAvailable}) {
    isBrightnessSensorAvailable =
        isBrightnessSensorAvailable ?? Future.value(true);
    final mockBrightnessStreamProvider =
        MockStreamDoubleProvider(brightnessStream).init();
    final mockIsBrightnessSensorAvailableProvider =
        MockFutureBoolProvider(isBrightnessSensorAvailable).init();
    final container = ProviderContainer(overrides: [
      brightnessStreamProvider
          .overrideWithProvider(mockBrightnessStreamProvider),
      isBrightnessSensorAvailableProvider
          .overrideWithProvider(mockIsBrightnessSensorAvailableProvider)
    ]);
    addTearDown(container.dispose);
    return container;
  }
}

class MockStreamDoubleProvider extends Mock {
  MockStreamDoubleProvider(this.stream);

  final Stream<double?> stream;

  StreamProvider<double?> init() => StreamProvider((ref) => stream);
}

class MockFutureBoolProvider extends Mock {
  MockFutureBoolProvider(this.flag);

  final Future<bool?> flag;

  FutureProvider<bool?> init() => FutureProvider((ref) => flag);
}

class AppModelTestData implements TestData {
  Widget prepareDependency() {
    final appModel = AppModelStateNotifier()
      ..init(
          router: GoRouter(
        initialLocation: '/brightness',
        routes: [
          GoRoute(
              path: '/brightness',
              builder: (context, state) => const BrightnessView()),
        ],
      ));

    return ProviderScope(
        overrides: [appModelProvider.overrideWithValue(appModel)],
        child: const AppLoading());
  }

  ProviderContainer prepareDependencyUT(
      {Map<String, Object>? sharedPreferencesInitValue}) {
    SharedPreferences.setMockInitialValues(sharedPreferencesInitValue ?? {});
    final sharedPreferences = Future.value(SharedPreferences.getInstance());
    final mockSharedPreferencesProvider =
        MockSharedPreferencesProvider(sharedPreferences).init();
    final container = ProviderContainer(overrides: [
      sharedPreferencesProvider
          .overrideWithProvider(mockSharedPreferencesProvider)
    ]);
    addTearDown(container.dispose);
    return container;
  }
}

class MockSharedPreferencesProvider extends Mock {
  MockSharedPreferencesProvider(this.instance);

  final Future<SharedPreferences> instance;

  FutureProvider<SharedPreferences> init() => FutureProvider((ref) => instance);
}
