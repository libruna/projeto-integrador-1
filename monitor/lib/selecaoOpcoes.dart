import 'package:flutter/material.dart';
import 'package:monitor/main.dart';
import 'package:monitor/relatorio.dart';

class SelecaoOpcao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Seleção'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              height: 50), // Espaçamento entre a barra de status e o título
          _criaTitulo(context),
          SizedBox(height: 100), // Espaçamento entre o título e os botões
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _criaBotao(
                'GERAR RELATÓRIO',
                '../assets/botaoRelatorio.png',
                () {
                  _navegaParaPagRelatorio(context);
                },
              ),
              SizedBox(width: 300), // Espaçamento de 300 pixels entre os botões
              _criaBotao(
                'GERAR VOO',
                '../assets/botaoVoo.png',
                () {
                  _navegaParaPagVoo(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _criaBotao(String title, String imagePath, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        onPrimary: Colors.black,
        padding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Container(
        width: 440,
        height: 570,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: 300,
                    height: 300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _criaTitulo(BuildContext context) {
    return FutureBuilder<String>(
      future: _recuperaNomeLancamento(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text(
              'Carregando...'); // Texto enquanto os dados estão sendo carregados
        } else if (snapshot.hasError) {
          return Text('Erro ao obter nome do lançamento'); // Tratamento de erro
        } else {
          return Text(
            snapshot.data ?? 'Lançamento',
            style: TextStyle(
              fontSize: 64,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ); // Texto com o nome do lançamento ou um título padrão
        }
      },
    );
  }

  Future<String> _recuperaNomeLancamento() async {
    // Substitua isso com a lógica real para obter o nome do lançamento do banco de dados
    await Future.delayed(Duration(seconds: 2));
    return 'Nome do Lançamento do Foguete'; // Exemplo de retorno, substitua com a lógica real
  }

  void _navegaParaPagRelatorio(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Relatorio()),
    );
  }

  void _navegaParaPagVoo(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPage()),
    );
  }
}
