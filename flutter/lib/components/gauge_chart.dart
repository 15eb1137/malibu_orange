import 'dart:math';

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
    double logit(num x) =>
        (log(x / (1500 - x)) / log(1.11)) +
        50; //1 / (1 + pow(1.07, -x + 100 / 2));
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
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(20),
                      text: '睡眠',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(20),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(75),
                      text: 'トイレ',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(75),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(200),
                      text: 'テレビ',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(200),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(300),
                      text: '料理',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(300),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(400),
                      text: 'PC',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(400),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(700),
                      text: '字書き',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(700),
                      color: Colors.deepOrange),
                  MarkerPointer(
                      markerType: MarkerType.text,
                      value: logit(1000),
                      text: '裁縫',
                      textStyle: const GaugeTextStyle(color: Colors.grey),
                      offsetUnit: GaugeSizeUnit.factor,
                      markerOffset: -0.1),
                  MarkerPointer(
                      markerType: MarkerType.invertedTriangle,
                      value: logit(1000),
                      color: Colors.deepOrange)
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
                            style:
                                TextStyle(fontSize: 24, color: Colors.blueGrey))
                      ]))
                ])
          ]
        : [];

    return SfRadialGauge(axes: axes);
  }
}
