import 'package:app_imc_flutter/models/imc_model.dart';
import 'package:app_imc_flutter/models/imc_model_sqlite.dart';
import 'package:app_imc_flutter/repositories/imc_sqlite_repository.dart';
import 'package:app_imc_flutter/services/imc_calc_services.dart';
import 'package:app_imc_flutter/services/sharedPreferencesData.dart';
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
  ImcSqliteRepository imcSqliteRepository = ImcSqliteRepository();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  late String resultado = '';

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  Sharedpreferencesdata dataAltura = Sharedpreferencesdata();

  void carregarDados() async {
    double altura = await dataAltura.getShared() ?? 0;
    if (altura != null) {
      alturaController.text = altura.toString();
    }
  }

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

  void _calcularImc() async {
    double peso = double.tryParse(pesoController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;
    dataAltura.setShared(altura);
    String classificacaoImc = calcimc(peso: peso, altura: altura);
    ImcModel imcModel =
        ImcModel(altura: altura, peso: peso, imc: classificacaoImc);
    await imcSqliteRepository
        .salvar(ImcModelSqlite(altura, 0, classificacaoImc, peso));
    setState(() {
      resultado = classificacaoImc;
    });
    widget.onImcCalculated(imcModel);
  }
}
