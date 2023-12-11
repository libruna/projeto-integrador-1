import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
// 'pdf_generator.dart.txt';
import 'grafDistancia.dart';
import 'grafVelocidade.dart';
import 'grafAltitude.dart';
import 'graficox.dart';
import 'graficoy.dart';
import 'graficoz.dart';
import 'grafVolume.dart';
import 'grafPeso.dart';

class Relatorio extends StatelessWidget {
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Página Relatorio'),
            backgroundColor: Color(0xFF192655)),
        body: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: DistanceChart(
                    left: 250,
                    top: 500,
                    height: 400,
                    width: 700,
                  ),
                ),
                Expanded(
                  child: VelocityChart(
                    left: 250,
                    top: 15,
                    height: 400,
                    width: 700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: HighChart(
                    left: 1000,
                    top: 15,
                    height: 400,
                    width: 700,
                  ),
                ),
                Expanded(
                  child: TimeAngleXChart(
                    left: 1000,
                    top: 500,
                    height: 400,
                    width: 700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: TimeAngleYChart(
                    left: 250,
                    top: 1000,
                    height: 400,
                    width: 700,
                  ),
                ),
                Expanded(
                  child: TimeAngleZChart(
                    left: 1000,
                    top: 1000,
                    height: 400,
                    width: 700,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: VolumeChart(
                    left: 250,
                    top: 1000,
                    height: 400,
                    width: 700,
                  ),
                ),
                Expanded(
                  child: WeightChart(
                    left: 1000,
                    top: 1000,
                    height: 400,
                    width: 700,
                  ),
                ),
              ],
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //  onPressed: () async {
        //     // Aguarde a renderização dos gráficos
        //     await Future.delayed(Duration(seconds: 1));

        //     // Gere o PDF
        //     await PdfGenerator.generatePdf(screenshotController);

        //     ScaffoldMessenger.of(context).showSnackBar(
        //       SnackBar(
        //         content: Text('PDF generated successfully'),
        //       ),
        //     );
        //   },
        //  child: Icon(Icons.picture_as_pdf),
        // ),
      ),
    );
  }
}
