// chart_widget.dart

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TimeDistanceChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 10,
      child: Column(
        children: [
          Text(
            'Gráfico de Tempo vs Distância',
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
                ),
                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 7,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
                      FlSpot(4, 5),
                      FlSpot(5, 1),
                      FlSpot(6, 4),
                    ],
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
