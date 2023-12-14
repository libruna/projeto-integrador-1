import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TimeAngleXChart extends StatefulWidget {
  final double left;
  final double top;
  final double width;
  final double height;

  const TimeAngleXChart({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  _TimeAngleXChartState createState() => _TimeAngleXChartState();
}

class _TimeAngleXChartState extends State<TimeAngleXChart> {
  List<FlSpot> data = [];

  double maxX = 10;
  double maxY = 180;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Column(
        children: [
          Text(
            'Gráfico de Variância x vs Tempo',
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
