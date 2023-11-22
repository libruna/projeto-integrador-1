import 'package:flutter/material.dart';
import 'package:rinf/rinf.dart';
import 'package:monitor/messages/pressure_stream.pb.dart' as pressure_stream;
import 'package:syncfusion_flutter_gauges/gauges.dart';

class PressureGauge extends StatelessWidget {
  const PressureGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<RustSignal>(
      stream: rustBroadcaster.stream.where((rustSignal) {
        return rustSignal.resource == pressure_stream.ID;
      }),
      builder: (context, snapshot) {
        final rustSignal = snapshot.data;
        if (rustSignal == null) {
          return const Text("Nothing received yet");
        } else {
          final signal = pressure_stream.StateSignal.fromBuffer(
            rustSignal.message!,
          );
          final currentNumber = signal.pressure;
          return SfRadialGauge(axes: <RadialAxis>[
            RadialAxis(
                minimum: 0,
                maximum: 200,
                labelOffset: 30,
                axisLineStyle: AxisLineStyle(
                    thicknessUnit: GaugeSizeUnit.factor, thickness: 0.03),
                majorTickStyle: MajorTickStyle(
                    length: 6, thickness: 4, color: Colors.black),
                minorTickStyle: MinorTickStyle(
                    length: 3, thickness: 3, color: Colors.black),
                axisLabelStyle: GaugeTextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
                ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 200,
                      sizeUnit: GaugeSizeUnit.factor,
                      startWidth: 0.03,
                      endWidth: 0.03,
                      gradient: SweepGradient(colors: const <Color>[
                        Colors.green,
                        Colors.yellow,
                        Colors.red
                      ], stops: const <double>[
                        0.0,
                        0.5,
                        1
                      ]))
                ],
                pointers: <GaugePointer>[
                  NeedlePointer(
                      value: currentNumber,
                      needleLength: 0.5,
                      enableAnimation: false,
                      animationType: AnimationType.ease,
                      needleStartWidth: 1.5,
                      needleEndWidth: 6,
                      needleColor: Colors.red,
                      knobStyle: KnobStyle(knobRadius: 0.09))
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                      widget: Container(
                          child: Column(children: <Widget>[
                        Text(currentNumber.toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                        SizedBox(height: 20),
                        Text('PSI',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold))
                      ])),
                      angle: 90,
                      positionFactor: 1.6)
                ])
          ]);
        }
      },
    );
  }
}
