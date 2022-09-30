import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:malibu_orange/pages/brightness.dart';

import 'package:syncfusion_flutter_gauges/gauges.dart';

class GaugeChart extends ConsumerWidget {
  const GaugeChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double brightness = ref.watch(
        brightnessModelProvider.select((model) => model.brightness ?? 0));

    final colorMain = brightness >= 70
        ? Colors.blue
        : brightness >= 50
            ? Colors.amber
            : Colors.deepOrange;
    final colorSub = brightness >= 70
        ? Colors.blue.shade100
        : brightness >= 50
            ? Colors.amber.shade100
            : Colors.deepOrange.shade100;
    final colorText = brightness >= 70
        ? Colors.blue.shade700
        : brightness >= 50
            ? Colors.amber.shade700
            : Colors.deepOrange.shade700;
    return SfRadialGauge(
      axes: <RadialAxis>[
        RadialAxis(
          minimum: 0,
          maximum: 100,
          showAxisLine: false,
          showLabels: false,
          ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0, endValue: brightness, color: colorMain),
            GaugeRange(
                startValue: brightness, endValue: 100, color: colorSub)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
              widget: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${brightness.floor()}',
                      style: TextStyle(fontSize: 64, color: colorText),
                    ),
                    Text('${brightness}lx'),
                  ],
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
