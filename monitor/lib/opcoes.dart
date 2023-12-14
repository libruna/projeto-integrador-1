import 'package:flutter/material.dart';
import 'relatorio.dart';

class Options extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 50,
      top: 650,
      height: 100,
      child: Row(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Relatorio()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text('Relatório'),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Text('Limpar'),
          ),
        ],
      ),
    );
  }
}
