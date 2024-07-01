import 'package:app_imc_flutter/models/imc_model.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  final String title;
  final List<ImcModel> lista;

  ListPage({super.key, required this.title, required this.lista});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          ImcModel imcModel = lista[index];
          return ListTile(
            title: Text('IMC: ${imcModel.imc}'),
            subtitle: Text('Altura: ${imcModel.altura} m, Peso: ${imcModel.peso} kg'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: lista.length,
      ),
    );
  }
}
