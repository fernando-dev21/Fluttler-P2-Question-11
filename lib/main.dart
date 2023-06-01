import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Prestações',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PrestacoesScreen(),
    );
  }
}

class PrestacoesScreen extends StatefulWidget {
  @override
  _PrestacoesScreenState createState() => _PrestacoesScreenState();
}

class _PrestacoesScreenState extends State<PrestacoesScreen> {
  TextEditingController _prestacaoController = TextEditingController();
  int _anos = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Prestações'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Digite o valor da primeira prestação:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: TextField(
                controller: _prestacaoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Valor da prestação',
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                double primeiraPrestacao =
                    double.parse(_prestacaoController.text);
                double valorPrestacao = primeiraPrestacao;
                int anos = 0;

                while (valorPrestacao <= 5000) {
                  valorPrestacao *= 2;
                  anos++;
                }

                setState(() {
                  _anos = anos;
                });
              },
              child: Text('Calcular'),
            ),
            SizedBox(height: 16),
            Text(
              'A prestação estará acima de R\$ 5.000,00 em $_anos anos.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
