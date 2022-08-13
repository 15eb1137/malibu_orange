import 'package:environment_sensors/environment_sensors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:malibu_orange/app.dart';
import 'package:malibu_orange/components/app_bar.dart';

part 'brightness.freezed.dart';

final brightnessModelProvider =
    StateNotifierProvider<BrightnessModelStateNotifier, BrightnessModelState>(
        (ref) {
  final isBrightnessSensorAvailable =
      ref.watch(isBrightnessSensorAvailableProvider);
  final brightness = ref.watch(brightnessStreamProvider).value;
  return isBrightnessSensorAvailable.when(
      data: (data) => BrightnessModelStateNotifier()
        ..setBrightness(brightness)
        ..setIsBrightnessSensorAvailable(data),
      error: (err, _) => throw Exception(err),
      loading: () => BrightnessModelStateNotifier());
});

class BrightnessModelStateNotifier extends StateNotifier<BrightnessModelState> {
  BrightnessModelStateNotifier()
      : super(const BrightnessModelState(null, null));

  void setBrightness(double? brightness) =>
      state = state.copyWith(brightness: brightness);
  void setIsBrightnessSensorAvailable(bool? isBrightnessSensorAvailable) =>
      state = state.copyWith(
          isBrightnessSensorAvailable: isBrightnessSensorAvailable);
}

@freezed
class BrightnessModelState with _$BrightnessModelState {
  const factory BrightnessModelState(
          double? brightness, bool? isBrightnessSensorAvailable) =
      _BrightnessModelState;
}

final brightnessStreamProvider =
    StreamProvider<double?>((ref) => EnvironmentSensors().light);

final isBrightnessSensorAvailableProvider = FutureProvider<bool?>(
    (ref) async => EnvironmentSensors().getSensorAvailable(SensorType.Light));

class BrightnessView extends ConsumerWidget {
  const BrightnessView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appModelController = ref.watch(appModelProvider.notifier);
    final isBrightnessSensorAvailable =
        ref.watch(brightnessModelProvider).isBrightnessSensorAvailable;
    final brightness = ref.watch(brightnessModelProvider).brightness ?? 0;
    Widget getBrightnessImage() => isBrightnessSensorAvailable == null
        ? Image.asset('assets/images/loading.png', fit: BoxFit.cover)
        : isBrightnessSensorAvailable
            ? brightness > 300
                ? Image.asset('assets/images/bright.png', fit: BoxFit.cover)
                : Image.asset('assets/images/middark.png', fit: BoxFit.cover)
            : Image.asset('assets/images/failed.png', fit: BoxFit.cover);
    return Scaffold(
      appBar: const AppBarComponent(title: 'お部屋の明るさ測定'),
      body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: getBrightnessImage()),
      floatingActionButton: FloatingActionButton(
          onPressed: () => appModelController.setThemeMode(),
          child: const Icon(Icons.lightbulb)),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
    );
  }
}
