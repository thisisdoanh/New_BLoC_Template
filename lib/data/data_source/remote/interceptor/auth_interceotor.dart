import 'package:dio/dio.dart';
import 'package:new_bloc_template/core/extension/string_extension.dart';
import 'package:new_bloc_template/data/data_source/local/token_provider.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(this._tokenProvider);
  final TokenProvider _tokenProvider;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenProvider.token;
    if (token.accessToken.isNotNullOrEmpty) {
      options.headers['Authorization'] = 'Bearer ${token.accessToken}';
    }
    options.headers['Content-Type'] = 'application/json';
    return super.onRequest(options, handler);
  }
}
