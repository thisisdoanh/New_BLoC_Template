import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/core/enum/language.dart';
import 'package:new_bloc_template/data/data_source/local/app_local_data_source.dart';
import 'package:new_bloc_template/domain/repositories/app_repo.dart';

@LazySingleton(as: AppRepo)
class AppRepoImpl implements AppRepo {
  AppRepoImpl(this._appLocalDataSource);
  final AppLocalDataSource _appLocalDataSource;

  @override
  Language getSavedLanguage() {
    return _appLocalDataSource.currentLanguage;
  }

  @override
  Future<void> saveLanguage({required Language language}) {
    return _appLocalDataSource.saveLanguage(language: language);
  }

  @override
  ThemeMode get themeMode => _appLocalDataSource.themeMode;

  @override
  Future<void> saveTheme({required ThemeMode themeMode}) {
    return _appLocalDataSource.saveTheme(themeMode: themeMode);
  }
}
