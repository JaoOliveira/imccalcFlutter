import 'package:app_imc_flutter/data/database.dart';
import 'package:app_imc_flutter/models/imc_model_sqlite.dart';

class ImcSqliteRepository {
  Future<List<ImcModelSqlite>> obterDados() async {
    List<ImcModelSqlite> imc = [];
    var db = await SqliteDatabase().getDatabase();
    var result = await db.rawQuery('SELECT id, altura, peso, imc FROM imc');

    for (var element in result) {
      imc.add(ImcModelSqlite(
          double.parse(element["altura"].toString()),
          int.parse(element["id"].toString()),
          element["imc"].toString(),
          double.parse(element["peso"].toString())));
    }
    return imc;
  }

  Future<void> salvar(ImcModelSqlite) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawInsert('INSERT INTO imc (altura, peso, imc) values(?,?,?)', [
      ImcModelSqlite.altura(),
      ImcModelSqlite.peso(),
      ImcModelSqlite.imc(),
    ]);
  }

  Future<void> update(ImcModelSqlite) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawInsert(
        'UPDATE INTO imc SET altura = ?,peso = ? , imc= ?) WHERE id = ?', [
      ImcModelSqlite.altura(),
      ImcModelSqlite.peso(),
      ImcModelSqlite.imc(),
      ImcModelSqlite.id(),
    ]);
  }

  Future<void> delete(ImcModelSqlite) async {
    var db = await SqliteDatabase().getDatabase();
    await db.rawInsert('DELETED  imc WHERE id = ?', [
      ImcModelSqlite.id(),
    ]);
  }
}
