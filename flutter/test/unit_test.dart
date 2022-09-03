import 'package:flutter_test/flutter_test.dart';
import 'package:malibu_orange/pages/brightness.dart';

import 'test_data.dart';

// import 'test_data.dart';

void main() {
  group('Brightness model tests', (() {
    final testData = BrightnessModelTestData();

    test('Brightness model brightness test 1', () async {
      final container = testData.prepareDependency(
          brightnessStream: Stream.fromIterable([25.0]));
      await container.read(isBrightnessSensorAvailableProvider.future);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, 25.0);
    });
    test('Brightness model brightness test 2', () async {
      final container = testData.prepareDependency(
          brightnessStream: Stream.fromIterable([27.0]));
      await container.read(isBrightnessSensorAvailableProvider.future);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, 27.0);
    });
    test('Brightness model brightness test 3', () async {
      final container = testData.prepareDependency(
          brightnessStream: Stream.fromIterable([26.0, 28.0]));
      await container.read(isBrightnessSensorAvailableProvider.future);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, 26.0);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, 28.0);
    });
    test('Brightness model brightness test null', () async {
      final container = testData.prepareDependency(
          brightnessStream: Stream.fromIterable([null, 29.0]));
      await container.read(isBrightnessSensorAvailableProvider.future);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, null);
      await container.read(brightnessStreamProvider.future);
      expect(container.read(brightnessModelProvider).brightness, 29.0);
    });
    test('Brightness model isBrightnessSensorAvailable test loading', () async {
      final container = testData.prepareDependency();
      expect(
          container.read(brightnessModelProvider).isBrightnessSensorAvailable,
          null);
    });
    test('Brightness model isBrightnessSensorAvailable test false', () async {
      final container = testData.prepareDependency(
          isBrightnessSensorAvailable: Future.value(false));
      await container.read(isBrightnessSensorAvailableProvider.future);
      expect(
          container.read(brightnessModelProvider).isBrightnessSensorAvailable,
          false);
    });
    test('Brightness model isBrightnessSensorAvailable test true', () async {
      final container = testData.prepareDependency(
          isBrightnessSensorAvailable: Future.value(true));
      await container.read(isBrightnessSensorAvailableProvider.future);
      expect(
          container.read(brightnessModelProvider).isBrightnessSensorAvailable,
          true);
    });
    test('Brightness model working mode test', () async {
      final container = testData.prepareDependency();
      expect(container.read(brightnessModelProvider).workingMode,
          WorkingMode.work);
      container.read(brightnessModelProvider.notifier).changeWorkingMode();
      expect(container.read(brightnessModelProvider).workingMode,
          WorkingMode.sleep);
      container.read(brightnessModelProvider.notifier).changeWorkingMode();
      expect(container.read(brightnessModelProvider).workingMode,
          WorkingMode.work);
    });
  }));
}
