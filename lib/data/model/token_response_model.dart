import 'package:json_annotation/json_annotation.dart';
import 'package:new_bloc_template/domain/entities/response/token_response.dart';

part 'token_response_model.g.dart';

@JsonSerializable()
class TokenResponseModel implements TokenResponse {
  TokenResponseModel({this.accessToken, this.refreshToken});

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  @override
  @JsonKey(name: 'accessToken')
  final String? accessToken;

  @override
  @JsonKey(name: 'refreshToken')
  final String? refreshToken;

  Map<String, dynamic> toJson() => _$TokenResponseModelToJson(this);
}
