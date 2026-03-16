import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:new_bloc_template/core/extension/string_extension.dart';
import 'package:new_bloc_template/data/data_source/local/token_provider.dart';
import 'package:new_bloc_template/data/data_source/remote/interceptor/curl_interceptor.dart';
import 'package:new_bloc_template/data/data_source/remote/url_end_point.dart';
import 'package:new_bloc_template/data/model/base_response_model.dart';
import 'package:new_bloc_template/data/model/token_response_model.dart';

final List<String> _arrSkipAuthPath = [UrlEndPoint.auth.login, UrlEndPoint.auth.signUp];

class SessionInterceptor extends QueuedInterceptor {
  SessionInterceptor({
    required this.baseUrl,
    required this.onSessionExpired,
    required this.tokenProvider,
  });
  final TokenProvider tokenProvider;
  final VoidCallback onSessionExpired;
  final String baseUrl;

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final token = tokenProvider.token;
    final errorCode = err.response?.statusCode;
    final authorization = 'Bearer ${token.accessToken}';
    if (_shouldRefreshToken(err.requestOptions.path, token, errorCode)) {
      final originalOptions = err.requestOptions;
      // If the token has been updated, repeat directly.
      if (authorization != originalOptions.headers['Authorization']) {
        originalOptions.headers['Authorization'] = authorization;
        // retry original request
        try {
          final dio = Dio()
            ..interceptors.addAll([
              CurlInterceptor(),
              LogInterceptor(
                request: kDebugMode,
                requestBody: kDebugMode,
                responseBody: kDebugMode,
                responseHeader: false,
                requestHeader: kDebugMode,
              ),
            ]);
          final res = await dio.fetch(originalOptions);
          handler.resolve(res);
          return;
        } on DioException catch (e) {
          handler.reject(e);
        }
      }
      // Lock to block the incoming request until the token updated

      final dio = Dio()
        ..options = BaseOptions(baseUrl: baseUrl, headers: {'Content-Type': 'application/json'})
        ..interceptors.addAll([
          CurlInterceptor(),
          if (kDebugMode)
            LogInterceptor(
              request: true,
              requestBody: true,
              responseBody: true,
              responseHeader: true,
              requestHeader: true,
            ),
        ]);
      try {
        final response = await dio.post(
          UrlEndPoint.auth.refreshToken,
          data: {'refreshToken': token.refreshToken ?? ''},
        );
        final base = BaseResponseModel<TokenResponseModel>.fromJson(
          response.data,
          (json) => TokenResponseModel.fromJson(json as Map<String, dynamic>),
        );
        tokenProvider.setToken(base.data);
        originalOptions.headers['Authorization'] = 'Bearer ${base.data?.accessToken ?? ''}';
        // Map<String, dynamic> data = jsonDecode(_originalOptions.data);
        // if (data.containsKey('accessToken')) {
        //   data['accessToken'] = newToken.accessToken ?? ''; // TODO: update new token in body
        //   _originalOptions.data = data;
        // }
        try {
          final dioFetchAgain = Dio()
            ..interceptors.addAll([
              CurlInterceptor(),
              LogInterceptor(
                request: kDebugMode,
                requestBody: kDebugMode,
                responseBody: kDebugMode,
                responseHeader: false,
                requestHeader: kDebugMode,
              ),
            ]);
          final res = await dioFetchAgain.fetch(originalOptions);
          handler.resolve(res);
          return;
        } on DioException catch (e) {
          handler.reject(e);
        }
      } on DioException catch (e) {
        onSessionExpired();
        return handler.next(e);
      }
    }
    return handler.next(err);
  }

  /// If the token is not existing or the error not relate to token issue, continue with the error
  bool _shouldRefreshToken(String path, TokenResponseModel token, int? errorCode) =>
      token.accessToken.isNotNullOrEmpty &&
      !_arrSkipAuthPath.contains(path) &&
      (errorCode == 401 || errorCode == 403);
}
