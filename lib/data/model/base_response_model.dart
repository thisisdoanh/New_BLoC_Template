import 'package:json_annotation/json_annotation.dart';
import 'package:new_bloc_template/domain/entities/response/base_response.dart';

part 'base_response_model.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponseModel<T> implements BaseResponse<T> {
  const BaseResponseModel(this.data, this.message);

  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$BaseResponseModelFromJson(json, fromJsonT);

  @override
  @JsonKey(name: 'data')
  final T? data;

  @override
  @JsonKey(name: 'message')
  final String message;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseModelToJson(this, toJsonT);
}
