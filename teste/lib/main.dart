import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:testando/grafico2.dart';
import 'package:testando/graficoy.dart';
import 'package:testando/graficoz.dart';
import 'package:testando/opcoes.dart';
import 'bateria.dart';
import 'grafico.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter_cube/flutter_cube.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xAA3676BF),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _navigateToNewPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => NewPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline6,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _navigateToNewPage,
              child: Text('Go to New Page'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  final double currentNumber = 120.0; // Substitua pelo valor desejado

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Page'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              right: 75,
              top: 100,
              child: Container(
                width: 200,
                height: 200,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 0,
                      maximum: 200,
                      radiusFactor: 1.5,
                      labelOffset: 30,
                      axisLineStyle: AxisLineStyle(
                        thicknessUnit: GaugeSizeUnit.factor,
                        thickness: 0.03,
                      ),
                      majorTickStyle: MajorTickStyle(
                        length: 6,
                        thickness: 4,
                        color: Colors.black,
                      ),
                      minorTickStyle: MinorTickStyle(
                        length: 3,
                        thickness: 3,
                        color: Colors.black,
                      ),
                      axisLabelStyle: GaugeTextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      ranges: <GaugeRange>[
                        GaugeRange(
                          startValue: 0,
                          endValue: 50,
                          color: Colors.green,
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.03,
                          endWidth: 0.03,
                        ),
                        GaugeRange(
                          startValue: 50,
                          endValue: 100,
                          color: Colors.orange,
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.03,
                          endWidth: 0.03,
                        ),
                        GaugeRange(
                          startValue: 100,
                          endValue: 150,
                          color: Colors.red,
                          sizeUnit: GaugeSizeUnit.factor,
                          startWidth: 0.03,
                          endWidth: 0.03,
                        ),
                      ],
                      pointers: <GaugePointer>[
                        NeedlePointer(
                          value: currentNumber,
                          needleLength: 0.5,
                          enableAnimation: false,
                          animationType: AnimationType.ease,
                          needleStartWidth: 1.5,
                          needleEndWidth: 6,
                          needleColor: Colors.red,
                          knobStyle: KnobStyle(knobRadius: 0.09),
                        ),
                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  currentNumber.toStringAsFixed(2),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'PSI',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          angle: 90,
                          positionFactor: 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 500,
              top: 500,
              child: Cube(
                onSceneCreated: (Scene scene) {
                  Object cube = Object(
                    scale: Vector3(10, 10, 10),
                    backfaceCulling: false,
                    fileName: 'assets/cube/untitled.obj',
                  );

                  scene.world.add(cube);

                  // Carregue o modelo 3D

                  // Ajuste a posição da câmera e direcione-a para o ponto (0, 0, 0)
                  scene.camera.position.z = 50;
                  scene.camera.position.y = 20;
                },
              ),
            ),
            BatteryIndicator(batteryLevel: 100),

            TimeDistanceChart(),

            // ... (seu código de configuração do gráfico aqui)

            TimeAngleXChart(),
            TimeAngleYChart(),
            TimeAngleZChart(),
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
