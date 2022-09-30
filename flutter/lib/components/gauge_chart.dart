import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../pages/brightness.dart';

class GaugeChart extends ConsumerWidget {
  const GaugeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double brightness = ref.watch(
        brightnessModelProvider.select((model) => model.brightness ?? 0));
    const HSVColor himawari = HSVColor.fromAHSV(1.0, 48.0, 1.0, 0.99);
    final colorMain = brightness >= 300
        ? himawari.toColor()
        : brightness >= 50
            ? himawari.withSaturation(0.60).toColor()
            : himawari.withSaturation(0.20).toColor();
    final colorSub = Colors.blueGrey.shade100;
    return SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: 0,
          maximum: 500,
          showAxisLine: false,
          showLabels: false,
          ranges: <GaugeRange>[
            GaugeRange(startValue: 0, endValue: brightness, color: colorMain),
            GaugeRange(startValue: brightness, endValue: 500, color: colorSub)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                widget: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                  Text('${brightness.floor()}',
                      style:
                          TextStyle(fontSize: 64, color: himawari.toColor())),
                  const Text('lx',
                      style: TextStyle(fontSize: 24, color: Colors.blueGrey))
                ]))
          ])
    ]);
  }
}
