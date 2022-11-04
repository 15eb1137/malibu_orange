import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../pages/brightness.dart';

class GaugeChart extends ConsumerWidget {
  const GaugeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double brightness = ref.watch(
            brightnessModelProvider.select((model) => model.brightness)) ??
        0.0;
    final bool isBrightnessSensorAvailable = ref.watch(brightnessModelProvider
            .select((model) => model.isBrightnessSensorAvailable)) ??
        false;
    if (kDebugMode) {
      print('brightness: $brightness, available: $isBrightnessSensorAvailable');
    }
    if (isBrightnessSensorAvailable && (brightness != 0.0)) {
      const HSVColor himawari = HSVColor.fromAHSV(1.0, 48.0, 1.0, 0.99);
      final colorMain = brightness >= 300
          ? himawari.toColor()
          : brightness >= 50
              ? himawari.withSaturation(0.60).toColor()
              : himawari.withSaturation(0.20).toColor();
      final colorSub = Colors.blueGrey.shade100;
      double logit(num x) => (log(x / (1500 - x)) / log(1.11)) + 50;
      List<GaugePointer> labelPointer(double value, String label) {
        return [
          MarkerPointer(
              markerType: MarkerType.text,
              value: logit(value),
              text: label,
              textStyle: const GaugeTextStyle(color: Colors.grey),
              offsetUnit: GaugeSizeUnit.factor,
              markerOffset: -0.1),
          MarkerPointer(
              markerType: MarkerType.invertedTriangle,
              value: logit(value),
              color: Colors.deepOrange)
        ];
      }

      final List<RadialAxis> axes = brightness > 1
          ? <RadialAxis>[
              RadialAxis(
                  radiusFactor: 0.9,
                  minimum: 0,
                  maximum: logit(1200),
                  showAxisLine: false,
                  showLabels: false,
                  ranges: <GaugeRange>[
                    GaugeRange(
                      startValue: 0,
                      endValue: logit(brightness),
                      color: colorMain,
                      startWidth: 0.3,
                      endWidth: 0.3,
                      sizeUnit: GaugeSizeUnit.factor,
                    ),
                    GaugeRange(
                      startValue: logit(brightness),
                      endValue: logit(1200),
                      color: colorSub,
                      startWidth: 0.3,
                      endWidth: 0.3,
                      sizeUnit: GaugeSizeUnit.factor,
                    )
                  ],
                  pointers: <GaugePointer>[
                    ...labelPointer(20, '睡眠'),
                    ...labelPointer(75, 'トイレ'),
                    ...labelPointer(200, 'テレビ'),
                    ...labelPointer(300, '料理'),
                    ...labelPointer(400, 'PC'),
                    ...labelPointer(700, '字書き'),
                    ...labelPointer(1000, '裁縫'),
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        widget: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                          Text('${brightness.floor()}',
                              style: TextStyle(
                                  fontSize: 64, color: himawari.toColor())),
                          const Text('lx',
                              style: TextStyle(
                                  fontSize: 24, color: Colors.blueGrey))
                        ]))
                  ])
            ]
          : [];
      return SfRadialGauge(axes: axes);
    } else {
      return const Text('照度センサーが機能していません。\n端末設定を確認してみてください。');
    }
  }
}
