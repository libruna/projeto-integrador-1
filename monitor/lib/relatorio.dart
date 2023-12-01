import 'grafVelocidade.dart';
import 'package:flutter/material.dart';

class Relatorio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Relatorio'),
      ),
      body: Center(
        child: Stack(
          children: [
            VelocityChart(),
          ],
        )
        
      ),
    );
  }
}