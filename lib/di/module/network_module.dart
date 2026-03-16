import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/app/app_cubit/app_cubit.dart';
import 'package:new_bloc_template/core/common/api_constants.dart';
import 'package:new_bloc_template/data/data_source/local/token_provider.dart';
import 'package:new_bloc_template/data/data_source/remote/api_client.dart';
import 'package:new_bloc_template/data/data_source/remote/interceptor/auth_interceotor.dart';
import 'package:new_bloc_template/data/data_source/remote/interceptor/session_interceptor.dart';
import 'package:new_bloc_template/flavors.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:requests_inspector/requests_inspector.dart';

@module
abstract class NetworkModule {
  @Named('logging_interceptor')
  @singleton
  Interceptor get loggingInterceptor => PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    error: true,
    compact: false,
    responseBody: true,
    maxWidth: 150,
    logPrint: (o) => debugPrint('API ${o.toString()}'),
  );

  @Named('requests_inspector_interceptor')
  @singleton
  Interceptor requestsInspectorInterceptor() {
    return RequestsInspectorInterceptor();
  }

  @Named('auth_interceptor')
  @singleton
  Interceptor authInterceptor(TokenProvider tokenProvider) {
    return AuthInterceptor(tokenProvider);
  }

  @Named('session_interceptor')
  @singleton
  Interceptor sessionInterceptor(TokenProvider tokenProvider, AppCubit appCubit) {
    return SessionInterceptor(
      baseUrl: '',
      onSessionExpired: appCubit.onSessionExpired,
      tokenProvider: tokenProvider,
    );
  }

  @singleton
  Dio provideDio(
    @Named('logging_interceptor') Interceptor loggingInterceptor,
    @Named('requests_inspector_interceptor') Interceptor requestsInspectorInterceptor,
    @Named('auth_interceptor') Interceptor authInterceptor,
    @Named('session_interceptor') Interceptor sessionInterceptor,
  ) {
    final dio = Dio();

    dio
      ..options.connectTimeout = const Duration(milliseconds: ApiConstants.connectionTimeout)
      ..options.receiveTimeout = const Duration(milliseconds: ApiConstants.receiveTimeout)
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.addAll([authInterceptor, sessionInterceptor]);

    if (kDebugMode) {
      dio.interceptors.add(loggingInterceptor);
    }

    if (F.appFlavor.isDev) {
      dio.interceptors.add(requestsInspectorInterceptor);
    }
    return dio;
  }

  @singleton
  ApiClient getApiService(Dio dio) => ApiClient(dio: dio, baseUrl: '');
}
