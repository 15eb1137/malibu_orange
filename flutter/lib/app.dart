import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:go_router/go_router.dart';
import 'package:malibu_orange/components/ads.dart';
import 'package:malibu_orange/components/transition.dart';
import 'package:malibu_orange/pages/brightness.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app.freezed.dart';

final appModelProvider =
    StateNotifierProvider<AppModelStateNotifier, AppModelState>((ref) {
  final sharedPreferences = ref.watch(sharedPreferencesProvider);
  return sharedPreferences.when(
      data: (sharedPreferences) {
        final isThemeModeDark = sharedPreferences.getBool('isThemeModeDark');
        return AppModelStateNotifier()
          ..init(
              sharedPreferences: sharedPreferences,
              themeMode: isThemeModeDark != null
                  ? (isThemeModeDark ? ThemeMode.dark : ThemeMode.light)
                  : ThemeMode.system);
      },
      error: (err, _) => throw Exception(err),
      loading: () => AppModelStateNotifier());
});

class AppModelStateNotifier extends StateNotifier<AppModelState> {
  AppModelStateNotifier() : super(const AppModelState(null, null, null));

  Future<void> init(
      {GoRouter? router,
      ThemeMode? themeMode,
      SharedPreferences? sharedPreferences}) async {
    state = state.copyWith(
        router: router ??
            GoRouter(
              initialLocation: '/brightness',
              routes: [
                GoRoute(
                    path: '/brightness',
                    pageBuilder: (context, state) {
                      const duration = Duration(seconds: 3);
                      return CustomTransitionPage(
                          transitionDuration: duration,
                          child: const BrightnessView(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  Transition(
                                      duration: duration,
                                      animation: animation,
                                      child: child));
                    }),
              ],
            ),
        themeMode: themeMode,
        sharedPreferences: sharedPreferences);
  }

  void setThemeMode(ThemeMode themeMode) {
    final newTheme =
        state.themeMode != ThemeMode.dark ? ThemeMode.dark : ThemeMode.light;
    state = state.copyWith(themeMode: newTheme);
  }

  void setIsDarkMode(bool isDarkModeActive) =>
      state.sharedPreferences!.setBool('isDarkMode', isDarkModeActive);
}

@freezed
abstract class AppModelState with _$AppModelState {
  const factory AppModelState(GoRouter? router, ThemeMode? themeMode,
      SharedPreferences? sharedPreferences) = _AppModelState;
}

final sharedPreferencesProvider =
    FutureProvider((ref) async => SharedPreferences.getInstance());

class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(adProvider);
    final router = ref.watch(appModelProvider.select((model) => model.router))!;
    return MaterialApp.router(
      title: 'お部屋の明るさ測定',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: const MaterialColor(0xFFFFFFFF, <int, Color>{
                    50: Color(0xFFFFFFFF),
                    100: Color(0xFFFFFFFF),
                    200: Color(0xFFFFFFFF),
                    300: Color(0xFFFFFFFF),
                    400: Color(0xFFFFFFFF),
                    500: Color(0xFFFFFFFF),
                    600: Color(0xFFFFFFFF),
                    700: Color(0xFFFFFFFF),
                    800: Color(0xFFFFFFFF),
                    900: Color(0xFFFFFFFF),
                  }),
                  brightness: Brightness.light)
              .copyWith(secondary: Colors.blueGrey, onSecondary: Colors.white)),
      darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
                  primarySwatch: const MaterialColor(0x00000000, <int, Color>{
                    50: Color(0x00000000),
                    100: Color(0x00000000),
                    200: Color(0x00000000),
                    300: Color(0x00000000),
                    400: Color(0x00000000),
                    500: Color(0x00000000),
                    600: Color(0x00000000),
                    700: Color(0x00000000),
                    800: Color(0x00000000),
                    900: Color(0x00000000),
                  }),
                  brightness: Brightness.dark)
              .copyWith(secondary: Colors.blueGrey, onSecondary: Colors.white)),
      themeMode: ref.watch(appModelProvider.select((model) => model.themeMode)),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
    );
  }
}
