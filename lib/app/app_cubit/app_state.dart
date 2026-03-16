import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:new_bloc_template/core/base_component/base_state.dart';
import 'package:new_bloc_template/core/enum/language.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState extends BaseState with _$AppState {
  const factory AppState({
    @Default(BaseStatus.initial) BaseStatus status,
    @Default(ThemeMode.light) ThemeMode mode,
    @Default(Language.english) Language currentLanguage,
  }) = _AppState;

  const AppState._({super.status = BaseStatus.initial, super.errorMessage});
}
