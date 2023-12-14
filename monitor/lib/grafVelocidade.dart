import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class VelocityChart extends StatefulWidget {
  final double left;
  final double top;
  final double width;
  final double height;

  const VelocityChart({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  VelocityState createState() => VelocityState();
}

class VelocityState extends State<VelocityChart> {
  List<FlSpot> data = [
    FlSpot(0, 0),
  ];

  double maxX = 10;
  double maxY = 300;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Column(
        children: [
          Text(
            'Gráfico de Velocidade vs Tempo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: widget.width,
            height: widget.height,
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      leftTitles: AxisTitles(
                        sideTitles:
                            SideTitles(reservedSize: 40, showTitles: true),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles:
                            SideTitles(reservedSize: 40, showTitles: true),
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
                    minY: 0,
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
                Positioned(
                  top: 200,
                  left: 350,
                  child: Text(
                    '${data.last.y.toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
