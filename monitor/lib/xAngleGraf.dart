import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:rinf/rinf.dart';
import 'package:monitor/messages/pressure_stream.pb.dart' as pressure_stream;

class TimeAngleXChart extends StatefulWidget {
  @override
  _TimeAngleXChartState createState() => _TimeAngleXChartState();
}

class _TimeAngleXChartState extends State<TimeAngleXChart> {
  List<FlSpot> data = [
   
  ];

  double maxX = 6; // Inicialize o valor máximo do eixo X
  double maxY = 180; // Inicialize o valor máximo do eixo Y

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

          // Adicione o novo ponto aos dados
          data.add(FlSpot(currentNumber,data.length.toDouble() ));

          // Atualize o máximo do eixo X se necessário
          if (data.length.toDouble() >= maxX) {
            maxX += 10;
            maxY += 10; // Aumente maxY em 10
          }

          return Positioned(
            left: 10,
            top: 500,
            child: Column(
              children: [
                Text(
                  'Gráfico de Tempo vs Ângulo x',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Container(
                  width: 800,
                  height: 400,
                  child: LineChart(
                    LineChartData(
                     
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                        show: true,
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 40, showTitles: true),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(reservedSize: 40, showTitles: true),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                      ),
                      borderData: FlBorderData(show: true),
                      minX: 0,
                      maxX: maxX,
                      minY: -180,
                      maxY: maxY,
                      lineBarsData: [
                        LineChartBarData(
                          spots: data,
                          isCurved: true,
                          color: Colors.redAccent,
                          dotData: FlDotData(show: false),
                          belowBarData: BarAreaData(show: true),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
