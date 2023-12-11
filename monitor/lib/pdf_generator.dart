import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class PdfGenerator {
  static Future<void> generatePdf(
      ScreenshotController screenshotController) async {
    final pdf = pw.Document();

    // Capture a screenshot e adicione à primeira página do PDF
    await _captureAndAddToPdf(pdf, screenshotController);

    // Role para baixo antes de capturar a segunda screenshot
    await Future.delayed(Duration(milliseconds: 500));
    screenshotController.captureAndSave('screenshot2.png');

    // Capture uma segunda screenshot e adicione à segunda página do PDF
    await _captureAndAddToPdf(pdf, screenshotController);

    // Gere um nome de arquivo único
    final fileName = 'report_${DateTime.now().millisecondsSinceEpoch}.pdf';

    // Crie o caminho completo do arquivo
    final Uint8List bytes = await pdf.save();

    // Crie um XFile usando o caminho temporário
    final xFile = XFile.fromData(bytes, name: fileName);

    // Compartilhe o PDF sem salvá-lo no armazenamento
    await Share.shareXFiles([xFile], text: fileName, subject: 'PDF Report');
  }

  static Future<void> _captureAndAddToPdf(
      pw.Document pdf, ScreenshotController screenshotController) async {
    try {
      final Uint8List? screenshot = await _captureScreen(screenshotController);
      if (screenshot != null) {
        pdf.addPage(
          pw.Page(
            build: (pw.Context context) {
              return pw.Center(
                child: pw.Image(pw.MemoryImage(screenshot)),
              );
            },
          ),
        );
      }
    } catch (e) {
      print('Error capturing screenshot: $e');
    }
  }

  static Future<Uint8List?> _captureScreen(
      ScreenshotController controller) async {
    try {
      return await controller.capture();
    } catch (e) {
      print('Error capturing screen: $e');
      return null;
    }
  }
}
