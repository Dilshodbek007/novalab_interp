import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  static Future<bool> saveInfo(String? info) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('info', info!);
  }

  static Future<String?> loadInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringId = prefs.getString('info');
    return stringId;
  }

  static Future<bool> saveDate(String? info) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString('date', info!);
  }

  static Future<String?> loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? stringId = prefs.getString('date');
    return stringId;
  }
}
