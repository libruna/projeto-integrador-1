import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TimeAngleYChart extends StatefulWidget {
  final double left;
  final double top;
  final double width;
  final double height;

  const TimeAngleYChart({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _TimeAngleYChartState createState() => _TimeAngleYChartState();
}

class _TimeAngleYChartState extends State<TimeAngleYChart> {
  List<FlSpot> data = [];

  double maxX = 20; // Inicialize o valor máximo do eixo X
  double maxY = 180;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Column(
        children: [
          Text(
            'Gráfico de Variância y vs Tempo',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: widget.width,
            height: widget.height,
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
}
