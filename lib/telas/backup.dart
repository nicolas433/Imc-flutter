import 'package:flutter/material.dart';

class TelaInicial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return "Classe da tela";
  }
}

class TelaInicialState extends State<TelaInicial> {
  String _textoResultado = "";
  TextEditingController _controllerPeso = TextEditingController();
  TextEditingController _controllerAltura = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
      ),
      body: Column(children: <Widget>[
        criarCampoTexto("Peso: (kg)", _controllerPeso),
        criarCampoTexto("Altura: (cm)", _controllerAltura),
        Text(_textoResultado),
        Container(
          height: 50.0,
          width: 200.0,
          child: ElevatedButton(
            onPressed: () {
              double peso = double.tryParse(_controllerPeso.text);
              double altura = double.tryParse(_controllerAltura.text);

              if (peso != null && altura != null) {
                altura = altura / 100;
                double imc = (peso / (altura * altura));
                setState(() {
                  _textoResultado = 'Imc: $imc';
                });
              } else {
                setState(() {
                  _textoResultado = "Entrada inválida.";
                });
              }
            },
          ),
        )
      ]),
    );
  }

  criarCampoTexto(String texto, TextEditingController controllerDeCampo) {
    return TextField(
      controller: controllerDeCampo,
      keyboardType: TextInputType.number,
    );
  }
}
