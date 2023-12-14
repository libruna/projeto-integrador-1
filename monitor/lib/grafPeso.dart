import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

class WeightChart extends StatefulWidget {
  final double left;
  final double top;
  final double width;
  final double height;

  const WeightChart({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  WeightState createState() => WeightState();
}

class WeightState extends State<WeightChart> {
  List<FlSpot> data = [FlSpot(0, 500)];
  double maxX = 6;
  double maxY = 300;
  double currentY = 0;
  TextEditingController _controller = TextEditingController();
  int tempo = 0;
  bool isGenerating = false;
  double enteredValue = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: widget.left,
      top: widget.top,
      child: Column(
        children: [
          Text(
            'Gráfico de Peso vs Tempo',
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
                  top: 250,
                  left: 50,
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: _controller,
                        onEditingComplete: () {
                          enteredValue = double.parse(_controller.text);
                          currentY = enteredValue;
                          isGenerating = true;
                          _generatePoints();
                          setState(() {});
                        },
                      ),
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

  void _generatePoints() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (isGenerating) {
          tempo++;
          if (tempo.toDouble() >= maxX) maxX += 10;

          if (currentY >= maxY) maxY += 300;
          data.add(FlSpot(tempo.toDouble(), currentY));
          currentY = enteredValue - (50 * tempo);

          if (currentY < 500) {
            isGenerating = false;
          }
        }
      });
    });
  }
}
