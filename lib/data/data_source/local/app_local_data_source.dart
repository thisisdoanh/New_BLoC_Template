import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/core/enum/language.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _localeKey = 'localeKey';
const String _themeKey = 'themeKey';

abstract class AppLocalDataSource {
  Language get currentLanguage;

  Future<void> saveLanguage({required Language language});

  ThemeMode get themeMode;

  Future<void> saveTheme({required ThemeMode themeMode});
}

@lazySingleton
class AppLocalDataSourceImpl implements AppLocalDataSource {
  AppLocalDataSourceImpl(this._preferences);
  final SharedPreferences _preferences;

  @override
  Language get currentLanguage {
    final String savedLang = _preferences.getString(_localeKey) ?? Language.vietnamese.languageName;
    return Language.fromName(savedLang);
  }

  @override
  Future<void> saveLanguage({required Language language}) async {
    await _preferences.setString(_localeKey, language.languageName);
  }

  @override
  ThemeMode get themeMode {
    final String savedTheme = _preferences.getString(_themeKey) ?? ThemeMode.dark.name;
    if (savedTheme == ThemeMode.light.name) {
      return ThemeMode.light;
    } else if (savedTheme == ThemeMode.dark.name) {
      return ThemeMode.dark;
    }
    return ThemeMode.system;
  }

  @override
  Future<void> saveTheme({required ThemeMode themeMode}) async {
    await _preferences.setString(_themeKey, themeMode.name);
  }
}
