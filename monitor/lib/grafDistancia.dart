import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DistanceChart extends StatefulWidget {
  @override
  DistanceState createState() => DistanceState();
}

class DistanceState extends State<DistanceChart> {
  List<FlSpot> data = [
    FlSpot(0, 3),
];

  double maxX = 10; // Inicialize o valor máximo do eixo X
  double maxY = 300;
  

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 250,
      top: 500,
      child: Column(
        children: [
          Text(
            'Gráfico de distância vs Tempo',
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
                        sideTitles: SideTitles(showTitles: false ),
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
          ElevatedButton(
            onPressed: () {
              // Adicione um novo ponto com valor aleatório entre -100 e 100
              setState(() {
                double newValue = data.length.toDouble();
                double randomValue = new Random().nextDouble() * 200; 
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