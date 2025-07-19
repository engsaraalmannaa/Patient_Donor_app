import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class StorageHelper {

  StorageHelper._();
  static StorageHelper? _helper;
  factory StorageHelper() => _helper ??= StorageHelper._();

  static Future<void> init() => GetStorage.init();

  final _storage = GetStorage(); // box

  Future<void> _setValue(String key,dynamic value)
  => _storage.write(key, value);

  Future<void> _remove(String key) =>
      _storage.remove(key);

  dynamic _read(String key) => _storage.read(key);

  bool _hasData(String key) => _storage.hasData(key);

  // TOKEN

  Future<void> setToken(String token) => _setValue('token', token);

  Future<void> removeToken() => _remove('token');

  String get token => _read('token');

  bool get hasToken => _hasData('token');

  // Theme

  Future<void> setTheme(bool theme) => _setValue('theme', theme);

  ThemeMode get themeMode => (_read('theme') ?? true) ? ThemeMode.light : ThemeMode.dark;


  // Theme

  Future<void> setLocale(bool locale) => _setValue('locale', locale);

  Locale get locale => (_read('locale') ?? true) ?
  const Locale('en','us') : const Locale('ar','sy');






}