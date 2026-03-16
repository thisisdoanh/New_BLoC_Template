import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/core/extension/string_extension.dart';
import 'package:new_bloc_template/data/model/token_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _tokenKey = 'token';

@singleton
class TokenProvider {
  TokenProvider(this._preferences);
  final SharedPreferences _preferences;

  TokenResponseModel get token {
    final String? data = _preferences.getString(_tokenKey);
    return data.isNotNullOrEmpty
        ? TokenResponseModel.fromJson(jsonDecode(data!))
        : TokenResponseModel();
  }

  Future<void> setToken(TokenResponseModel? token) async {
    await _preferences.setString(_tokenKey, token != null ? jsonEncode(token) : '');
  }

  Future<void> clearToken() async {
    await _preferences.remove(_tokenKey);
  }
}
