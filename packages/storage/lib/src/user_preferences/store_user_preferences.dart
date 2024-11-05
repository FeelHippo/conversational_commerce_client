import 'package:shared_preferences/shared_preferences.dart';
import 'user_preferences.dart';

class StoreUserPreferences extends UserPreferences {
  StoreUserPreferences();

  @override
  Future<void> putString({required String key, required String value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  @override
  Future<String> getString({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? prefData = prefs.getString(key);
    return prefData ?? '';
  }

  @override
  Future<bool> getBool({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? prefData = prefs.getBool(key);
    return prefData ?? false;
  }

  @override
  Future<void> putBool({required String key, required bool value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  @override
  Future<int> getInt({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? prefData = prefs.getInt(key);
    return prefData ?? 0;
  }

  @override
  Future<void> putInt({required String key, required int value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  @override
  Future<double> getDouble({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final double? prefData = prefs.getDouble(key);
    return prefData ?? 0.0;
  }

  @override
  Future<void> putDouble({required String key, required double value}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  @override
  Future<void> clearAllPref() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

}
