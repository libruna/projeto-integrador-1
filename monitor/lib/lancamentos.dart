import 'package:flutter/material.dart';
import 'package:monitor/selecaoOpcoes.dart';

class Lancamento extends StatefulWidget {
  @override
  _LancamentoState createState() => _LancamentoState();
}

class _LancamentoState extends State<Lancamento> {
  String nomeLancamento1 = 'Nome do lançamento 1';
  String nomeLancamento2 = 'Nome do lançamento 2';
  String nomeLancamento3 = 'Nome do lançamento 3';

  final double buttonWidth = 1000;
  final double buttonHeight = 50;
  final double alterarButtonSize = 50;

  String textoBotaoClicado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF192655),
        title: Text('Página de Lançamento'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: 280,
            top: 190,
            child: Text(
              'Seus Lançamentos',
              style: TextStyle(fontSize: 64),
            ),
          ),
          _buildLancamentoButton(1, nomeLancamento1),
          _buildLancamentoButton(2, nomeLancamento2),
          _buildLancamentoButton(3, nomeLancamento3),
        ],
      ),
    );
  }

  Widget _buildLancamentoButton(int index, String nomeLancamento) {
    return Positioned(
      width: buttonWidth,
      height: buttonHeight,
      left: 280,
      top: 320 + (70 * (index - 1)),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                _navegaParaSelecaoOpcao(context, nomeLancamento);
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size(buttonWidth, buttonHeight),
                primary: Color(0xFFFFDF7B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Text(nomeLancamento),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _alterarNomeLancamento(index);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: Size(alterarButtonSize, alterarButtonSize),
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            child: Image.asset(
              'assets/edicao.PNG',
              width: 100,
              height: 100,
            ),
          ),
        ],
      ),
    );
  }

  void _alterarNomeLancamento(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        TextEditingController controller = TextEditingController();
        return AlertDialog(
          title: Text('Alterar Nome do Lançamento'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Novo Nome do Lançamento'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  switch (index) {
                    case 1:
                      nomeLancamento1 = controller.text;
                      break;
                    case 2:
                      nomeLancamento2 = controller.text;
                      break;
                    case 3:
                      nomeLancamento3 = controller.text;
                      break;
                  }
                });

                textoBotaoClicado = controller.text;

                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
          ],
        );
      },
    );
  }

  void _navegaParaSelecaoOpcao(BuildContext context, String nomeLancamento) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => SelecaoOpcao(nomeLancamento: nomeLancamento)),
    );
  }
}
