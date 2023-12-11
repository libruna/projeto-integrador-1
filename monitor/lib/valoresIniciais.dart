import 'package:flutter/material.dart';
import 'relatorio.dart';

class Valores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 50,
      top: 700,
      height: 100,
      child: Positioned(
   
            right: 150,
            top: 600,
            child: Container(
              width: 50,  // Largura do quadrado
              height: 50, // Altura do quadrado
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black), // Adiciona uma borda
              ),
              child: Center(
                child: TextFormField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove a borda interna do TextFormField
                  ),
                  // Adicione a lógica para manipular o valor preenchido aqui
                  onChanged: (value) {
                   
                  },
                ),
              ),),)
    );
  }
}



 