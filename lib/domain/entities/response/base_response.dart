class BaseResponse<T> {
  const BaseResponse({
    this.statusCode,
    this.responseStatusCode,
    this.message,
    this.data,
    this.listData,
  });

  factory BaseResponse.fromJson(
    dynamic json,
    T Function(dynamic json)? fromJsonT, {
    int? statusCode,
  }) {
    Map<String, dynamic> jsonMap;

    if (json is List) {
      jsonMap = {'statusCode': statusCode, 'data': json};
    } else if (json is Map<String, dynamic>) {
      jsonMap = json;
    } else {
      jsonMap = {};
    }

    return BaseResponse<T>(
      statusCode: jsonMap['statusCode'] as int?,
      responseStatusCode: jsonMap['responseStatusCode'] as int?,
      message: jsonMap['message'] as String?,
      data: jsonMap['data'] != null && jsonMap['data'] is! List && fromJsonT != null
          ? fromJsonT(jsonMap['data'])
          : null,
      listData: jsonMap['data'] != null && jsonMap['data'] is List && fromJsonT != null
          ? (jsonMap['data'] as List).map((item) => fromJsonT(item)).toList()
          : null,
    );
  }

  final int? statusCode;
  final int? responseStatusCode;
  final String? message;
  final T? data;
  final List<T>? listData;

  Map<String, dynamic> toJson(Object? Function(T value)? toJsonT) {
    return {
      'statusCode': statusCode,
      'responseStatusCode': responseStatusCode,
      'message': message,
      'data': data != null && toJsonT != null ? toJsonT(data as T) : data,
      'listData': listData != null && toJsonT != null
          ? listData!.map((item) => toJsonT(item)).toList()
          : listData,
    };
  }

  bool get isSuccess => statusCode == 200 || statusCode == 201;

  bool get hasData => data != null;

  bool get hasListData => listData != null && listData!.isNotEmpty;

  String getErrorMessage({String defaultMessage = 'An error occurred'}) {
    return message ?? defaultMessage;
  }
}
