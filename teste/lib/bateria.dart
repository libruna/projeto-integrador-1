import 'package:flutter/material.dart';

class BatteryIndicator extends StatelessWidget {
  final int batteryLevel;

  const BatteryIndicator({Key? key, required this.batteryLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 45,
      top: 400,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Barra de bateria vertical
          Container(
            width: 20,
            height: 100,
            decoration: BoxDecoration(
              border:
                  Border.all(color: Colors.black, width: 2.5), // Ajuste aqui
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              heightFactor: batteryLevel / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: _getBatteryColor(),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 8),
          // Texto da porcentagem de bateria
          Text(
            '$batteryLevel%',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Color _getBatteryColor() {
    if (batteryLevel >= 70) {
      return Colors.green;
    } else if (batteryLevel >= 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }
}
