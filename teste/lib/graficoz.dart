import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TimeAngleZChart extends StatefulWidget {
  @override
  _TimeAngleZChartState createState() => _TimeAngleZChartState();
}

class _TimeAngleZChartState extends State<TimeAngleZChart> {
  List<FlSpot> data = [
    FlSpot(0, 3),
    FlSpot(1, 1),
    FlSpot(2, 4),
    FlSpot(3, 2),
    FlSpot(4, 5),
    FlSpot(5, 1),
    FlSpot(6, 4),
  ];

  double maxX = 6; // Inicialize o valor máximo do eixo X
  double maxY = 180;
  double lastYValue = 4.0; // Inicialize com um valor padrão

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 820,
      top: 10,
      child: Column(
        children: [
          Text(
            'Gráfico de Tempo vs Variância z',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: 700,
            height: 400,
            child: Stack(
              children: [
                LineChart(
                  LineChartData(
                    // ... (seu código de configuração do gráfico aqui)
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
          ElevatedButton(
            onPressed: () {
              // Adicione um novo ponto com valor aleatório entre -100 e 100
              setState(() {
                double newValue = data.length.toDouble();
                double randomValue = Random().nextDouble() * 200 -
                    100; // Gera valor entre -100 e 100
                data.add(FlSpot(newValue, randomValue));

                if (newValue >= maxX) {
                  maxX += 10;
                }
              });
            },
            child: Text('Adicionar Ponto'),
          ),
        ],
      ),
    );
  }
}
