import 'package:shared_preferences/shared_preferences.dart';

class Sharedpreferencesdata {
  Future<void> setShared(double valor) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('valorAltura', valor);
  }

  Future<double?> getShared() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('valorAltura');
  }
}
