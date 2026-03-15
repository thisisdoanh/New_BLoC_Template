import 'package:flutter/material.dart';
import 'package:new_bloc_template/core/enum/language.dart';

abstract class AppRepo {
  Locale getSavedLocale();

  Language getSavedLanguage();

  Future<void> saveLanguage({required Language language});

  ThemeMode get themeMode;

  Future<void> saveTheme({required ThemeMode themeMode});
}
