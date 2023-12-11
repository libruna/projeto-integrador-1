import 'dart:async';
import 'package:flutter/material.dart';
import 'package:monitor/pressureGauge.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'lancamentos.dart';
import 'graficox.dart';
import 'graficoy.dart';
import 'graficoz.dart';
import 'opcoes.dart';
import 'bateria.dart';
import 'grafDistancia.dart';

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Página do Voo'), backgroundColor: Color(0xFF192655)),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              right: 75,
              top: 100,
              width: 200,
              height: 200,
              child: PressureGauge(),
            ),
            BatteryIndicator(batteryLevel: 100),
            DistanceChart(left: 10, top: 10, height: 400, width: 500),
            TimeAngleXChart(left: 10, top: 450, height: 300, width: 500),
            TimeAngleYChart(left: 620, top: 450, height: 300, width: 500),
            TimeAngleZChart(left: 620, top: 10, height: 400, width: 500),
            Options(),
            Positioned(
              right: 150,
              top: 500,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a lógica do botão "Iniciar" aqui
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                child: Text('Iniciar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
