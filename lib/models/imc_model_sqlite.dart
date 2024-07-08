import 'dart:ffi';

class ImcModelSqlite {
  int _id = 0;
  double _altura = 0;
  double _peso = 0;
  String _imc = '';

  ImcModelSqlite(this._altura, this._id, this._imc, this._peso);
  
  String get imc => _imc;
  set imc(String imc) {
    _imc = imc;
  }

  double get altura => _altura;
  set altura(double altura) {
    _altura = altura;
  }

  double get peso => _peso;
  set peso(double peso) {
    _peso = peso;
  }

  int get id => _id;
  set id(int id) {
    _id = id;
  }
}
