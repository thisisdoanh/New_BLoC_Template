import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:new_bloc_template/data/data_source/local/token_provider.dart';
import 'package:new_bloc_template/data/model/base_response_model.dart';
import 'package:requests_inspector/requests_inspector.dart';

typedef ApiResponseToModelParser<T> = T Function(Map<String, dynamic> json);

abstract class ApiHandler {
  // parser JSON data {} => Object
  Future<BaseResponseModel<T>> post<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  // parser JSON data {} => Object
  Future<BaseResponseModel<T>> get<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  // parser JSON data {} => Object
  Future<BaseResponseModel<T>> put<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  // parser JSON data {} => Object
  Future<BaseResponseModel<T>> patch<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });

  // parser JSON data {} => Object
  Future<BaseResponseModel<T>> delete<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  });
}

@Singleton(as: ApiHandler)
class ApiClient implements ApiHandler {
  ApiClient({required this.dio, required this.baseUrl});

  final String baseUrl;
  final Dio dio;

  @override
  Future<BaseResponseModel<T>> post<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      final response = await dio.post(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode != null &&
          response.statusCode! < 300 &&
          response.data.toString().isEmpty) {
        return BaseResponseModel<T>(null, 'Empty Response');
      }
      return BaseResponseModel<T>.fromJson(
        response.data,
        (json) => parser(json as Map<String, dynamic>),
      );
    });
  }

  @override
  Future<BaseResponseModel<T>> get<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      final response = await dio.get(path, queryParameters: queryParameters, options: options);
      if (response.statusCode != null &&
          response.statusCode! < 300 &&
          response.data.toString().isEmpty) {
        return BaseResponseModel<T>(null, 'Empty Response');
      }
      return BaseResponseModel<T>.fromJson(
        response.data,
        (json) => parser(json as Map<String, dynamic>),
      );
    });
  }

  @override
  Future<BaseResponseModel<T>> delete<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      final response = await dio.delete(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode != null &&
          response.statusCode! < 300 &&
          response.data.toString().isEmpty) {
        return BaseResponseModel<T>(null, 'Empty Response');
      }
      return BaseResponseModel<T>.fromJson(
        response.data,
        (json) => parser(json as Map<String, dynamic>),
      );
    });
  }

  @override
  Future<BaseResponseModel<T>> put<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      final response = await dio.put(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode != null &&
          response.statusCode! < 300 &&
          response.data.toString().isEmpty) {
        return BaseResponseModel<T>(null, 'Empty Response');
      }
      return BaseResponseModel<T>.fromJson(
        response.data,
        (json) => parser(json as Map<String, dynamic>),
      );
    });
  }

  @override
  Future<BaseResponseModel<T>> patch<T>(
    String path, {
    required ApiResponseToModelParser<T> parser,
    Map<String, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _remapError(() async {
      final response = await dio.patch(
        path,
        data: body,
        queryParameters: queryParameters,
        options: options,
      );
      if (response.statusCode != null &&
          response.statusCode! < 300 &&
          response.data.toString().isEmpty) {
        return BaseResponseModel<T>(null, 'Empty Response');
      }
      return BaseResponseModel<T>.fromJson(
        response.data,
        (json) => parser(json as Map<String, dynamic>),
      );
    });
  }

  Future<T> _remapError<T>(ValueGetter<Future<T>> func) async {
    try {
      return await func();
    } catch (e) {
      throw await _apiErrorToInternalError(e);
    }
  }

  Future<dynamic> _apiErrorToInternalError(Object e) async {
    // if (e is DioException) {
    //   if (e.type == DioExceptionType.connectionTimeout ||
    //       e.type == DioExceptionType.receiveTimeout ||
    //       (e.type == DioExceptionType.unknown && e.error is SocketException)) {
    //     return NetworkIssueException();
    //   }
    //   return ServerException(e);
    // }
    return e;
  }
}
