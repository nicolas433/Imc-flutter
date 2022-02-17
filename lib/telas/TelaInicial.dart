import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaIncial extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TelaInicialState();
  }
}

class TelaInicialState extends State<TelaIncial> {
  String _textoResultado = '';
  String _urlImage = '';
  TextEditingController _controllerPeso = new TextEditingController();
  TextEditingController _controllerAltura = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de IMC"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
          ),
          criarCampoTexto("Peso (kg):", _controllerPeso),
          Container(
            margin: const EdgeInsets.only(bottom: 15.0),
          ),
          criarCampoTexto("Altura (cm):", _controllerAltura),
          Text(
            _textoResultado,
            style: TextStyle(fontSize: 25.0),
          ),
          Container(
            height: 50.0,
            width: 200.0,
            margin: const EdgeInsets.only(bottom: 10.0),
            child: ElevatedButton(
              onPressed: () {
                double peso = double.tryParse(_controllerPeso.text)!;
                double altura = double.tryParse(_controllerAltura.text)!;

                debugPrint('Peso: $peso');
                debugPrint('Peso: $altura');
                if (peso != null && altura != null) {
                  altura = altura / 100.0;

                  double _imc = (peso / (altura * altura));

                  // imc < 18,5
                  // imc >= 18,5 and imc <= 24,9
                  // imc >= 25 and imc <= 29,9
                  // imc >= 30 and imc <= 34,9
                  // imc >= 35 and imc <= 39,9
                  // imc >= 40

                  setState(() {
                    if (_imc < 18.5) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nAbaixo do Peso";
                      _urlImage = "images/peso1.jpg";
                    } else if (_imc >= 18.5 && _imc <= 24.9) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nPeso Normal";
                      _urlImage = "images/peso2.jpg";
                    } else if (_imc >= 25.0 && _imc <= 29.9) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nSobrepeso";
                      _urlImage = "images/peso3.jpg";
                    } else if (_imc >= 30.0 && _imc <= 34.9) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nObesidade Grau l";
                      _urlImage = "images/peso4.png";
                    } else if (_imc >= 35 && _imc <= 39.9) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nObesidade Grau ll";
                      _urlImage = "images/peso5.jpeg";
                    } else if (_imc >= 40) {
                      _textoResultado = " IMC: ${_imc.toStringAsPrecision(4)}\nObesidade Grau lll";
                      _urlImage = "images/peso6.jpeg";
                    }
                  });
                } else {
                  setState(() {
                    _textoResultado = 'Preencha os campos para IMC';
                  });
                }
              },
              child: Text("Calcular IMC"),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: _urlImage != '' ? Image(image: AssetImage(_urlImage)) : null,
            //child: _urlImage != '' ? Image.network(_urlImage, fit: BoxFit.cover) : null,
          )
        ],
      ),
    );
  }

  TextField criarCampoTexto(String texto, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: texto,
        border: OutlineInputBorder(),
        labelStyle: TextStyle(fontSize: 25.0, color: Colors.blue),
      ),
    );
  }
}
