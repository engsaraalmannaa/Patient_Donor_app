import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _pref;
  static Future init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future set(token, {required String key, required dynamic value}) async {
    if (value is int) return await _pref!.setInt(key, value);
    if (value is bool) return await _pref!.setBool(key, value);
    if (value is double) return await _pref!.setDouble(key, value);
    if (value is List<String>) return await _pref!.setStringList(key, value);
    else {
      return await _pref!.setString(key, value);
    }
  }

  static T? get<T>(String key) {
    T? value = _pref?.get(key) as T?;


    return value ?? null;
  }

  static int? getInt<int>(String key) {
    int? value = _pref?.getInt(key) as int?;
    return value;
  }

  static bool? getBool<T>(String key) {
    bool? value = _pref!.getBool(key);
    return value;
  }

  static Future<bool> remove(String key) async {
    return await _pref!.remove(key);
  }

  static Future<bool> clear() async {
    return await _pref!.clear();
  }

  static List<String>? getList(String key) {
    List<String>? value = _pref?.getStringList(key);
    return value ?? [];
  }

  static Future<void> addList(String key, String data) async {
    List<String>? value = _pref?.getStringList(key);
    if (value == null) {
      await _pref!.setStringList(key, [data]);
    } else {
      value.add(data);
      await _pref!.setStringList(key, value);
    }
  }
}
