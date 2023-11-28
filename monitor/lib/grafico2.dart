import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class TimeAngleXChart extends StatefulWidget {
  @override
  _TimeAngleXChartState createState() => _TimeAngleXChartState();
}

class _TimeAngleXChartState extends State<TimeAngleXChart> {
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
  double maxY = 360;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 10,
      top: 500,
      child: Column(
        children: [
          Text(
            'Gráfico de Tempo vs Variância x',
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
                // ... (seu código de configuração do gráfico aqui)
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
          ),
          ElevatedButton(
            onPressed: () {
              // Adicione um novo ponto quando o botão for pressionado
              setState(() {
                double newValue = data.length.toDouble();
                data.add(FlSpot(newValue, 2));

                if (newValue >= maxX) {
                  // Ajuste o valor máximo do eixo X e aumente a escala em 10
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
