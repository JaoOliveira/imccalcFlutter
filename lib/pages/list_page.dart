import 'package:app_imc_flutter/models/imc_model.dart';
import 'package:app_imc_flutter/models/imc_model_sqlite.dart';
import 'package:app_imc_flutter/repositories/imc_sqlite_repository.dart';
import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  final String title;

  ListPage({super.key, required this.title, required List<ImcModel> lista});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<ImcModelSqlite> _listas = [];

  ImcSqliteRepository imcSqliteRepository = ImcSqliteRepository();
  @override
  void initState() {
    super.initState();
    obterListImc();
  }

  void obterListImc() async {
    _listas = await imcSqliteRepository.obterDados();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          ImcModelSqlite imcModel = _listas[index];
          return ListTile(
            title: Text('IMC: ${imcModel.imc}'),
            subtitle:
                Text('Altura: ${imcModel.altura} m, Peso: ${imcModel.peso} kg'),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _listas.length,
      ),
    );
  }
}
