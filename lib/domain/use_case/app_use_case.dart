import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/core/enum/language.dart';
import 'package:new_bloc_template/domain/repositories/app_repo.dart';

@lazySingleton
class AppUseCase {
  AppUseCase(this._appRepo);
  final AppRepo _appRepo;

  Language getSavedLanguage() {
    return _appRepo.getSavedLanguage();
  }

  Future<Locale> changeLanguage(Language language) async {
    _appRepo.saveLanguage(language: language);
    return language.locale;
  }

  ThemeMode get themeMode => _appRepo.themeMode;

  Future<void> saveTheme({required ThemeMode themeMode}) {
    return _appRepo.saveTheme(themeMode: themeMode);
  }

  Future<ThemeMode> changeTheme() async {
    if (themeMode == ThemeMode.light) {
      _appRepo.saveTheme(themeMode: ThemeMode.dark);
      return ThemeMode.dark;
    } else {
      _appRepo.saveTheme(themeMode: ThemeMode.light);
      return ThemeMode.light;
    }
  }
}
