import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oms/shared/typedef.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
class LoginResponseModel with _$LoginResponseModel {
  factory LoginResponseModel({
    UserData? userData,
    Data? data,
    @Default(false) bool success,
    @Default("") String message,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(JSON json) =>
      _$LoginResponseModelFromJson(json);
}

@freezed
class UserData with _$UserData {
  factory UserData({
    required String name,
    required String email,
  }) = _UserData;

  factory UserData.fromJson(JSON json) => _$UserDataFromJson(json);
}

@freezed
class Data with _$Data {
  factory Data({
    required AccessToken accessToken,
  }) = _Data;

  factory Data.fromJson(JSON json) => _$DataFromJson(json);
}

@freezed
class AccessToken with _$AccessToken {
  factory AccessToken({
    required Access access,
  }) = _AccessToken;

  factory AccessToken.fromJson(JSON json) => _$AccessTokenFromJson(json);
}

@freezed
class Access with _$Access {
  factory Access({
    required String token,
    String? expires,
  }) = _Access;

  factory Access.fromJson(JSON json) => _$AccessFromJson(json);
}
