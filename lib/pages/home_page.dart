import 'package:app_imc_flutter/models/imc_model.dart';
import 'package:app_imc_flutter/services/imc_calc_services.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
    required this.title,
    required this.onImcCalculated,
  });
  final String title;
  final ValueChanged<ImcModel> onImcCalculated;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  late String resultado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.number,
                controller: alturaController,
                decoration: InputDecoration(
                  labelText: 'Altura',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: pesoController,
                decoration: InputDecoration(
                  labelText: 'Peso',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              resultado.isEmpty ? SizedBox() : Text(resultado)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _calcularImc,
        child: const Icon(Icons.check),
      ),
    );
  }

  void _calcularImc() {
    double peso = double.parse(pesoController.text);
    double altura = double.parse(alturaController.text);
    String classificacaoImc = calcimc(peso: peso, altura: altura);
    ImcModel imcModel = ImcModel(altura: altura, peso: peso, imc: classificacaoImc);
    setState(() {
      resultado = classificacaoImc;
    });
    widget.onImcCalculated(imcModel);
  }
}
