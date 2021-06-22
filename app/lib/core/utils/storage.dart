import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

/// 本地存储
class StorageUtil {
  static StorageUtil _instance = new StorageUtil._();
  factory StorageUtil() => _instance;
  static SharedPreferences? _prefs;

  StorageUtil._();

  static Future<void> init() async {
    if (_prefs == null) {
      _prefs = await SharedPreferences.getInstance();
    }
  }

  Future<bool> setJSON(String key, dynamic jsonVal) {
    String jsonString = jsonEncode(jsonVal);

    return _prefs!.setString(key, jsonString);
  }

  dynamic getJSON(String key) {
    String jsonString = _prefs!.getString(key) ?? '';
    return jsonString == '' ? null : jsonDecode(jsonString);
  }

  Future<bool> setBool(String key, bool val) {
    return _prefs!.setBool(key, val);
  }

  bool getBool(String key) {
    bool val = _prefs!.getBool(key) ?? false;
    return val;
  }

  Future<bool> remove(String key) {
    return _prefs!.remove(key);
  }

  Future<bool> setStr(String key, String val) {
    return _prefs!.setString(key, val);
  }

  dynamic getStr(String key) {
    String val = _prefs!.getString(key) ?? '';
    return val;
  }
}
