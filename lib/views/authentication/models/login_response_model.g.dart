// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginResponseModel _$$_LoginResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_LoginResponseModel(
      userData: json['userData'] == null
          ? null
          : UserData.fromJson(json['userData'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? "",
    );

Map<String, dynamic> _$$_LoginResponseModelToJson(
        _$_LoginResponseModel instance) =>
    <String, dynamic>{
      'userData': instance.userData,
      'data': instance.data,
      'success': instance.success,
      'message': instance.message,
    };

_$_UserData _$$_UserDataFromJson(Map<String, dynamic> json) => _$_UserData(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$$_UserDataToJson(_$_UserData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };

_$_Data _$$_DataFromJson(Map<String, dynamic> json) => _$_Data(
      accessToken:
          AccessToken.fromJson(json['accessToken'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_DataToJson(_$_Data instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
    };

_$_AccessToken _$$_AccessTokenFromJson(Map<String, dynamic> json) =>
    _$_AccessToken(
      access: Access.fromJson(json['access'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_AccessTokenToJson(_$_AccessToken instance) =>
    <String, dynamic>{
      'access': instance.access,
    };

_$_Access _$$_AccessFromJson(Map<String, dynamic> json) => _$_Access(
      token: json['token'] as String,
      expires: json['expires'] as String?,
    );

Map<String, dynamic> _$$_AccessToJson(_$_Access instance) => <String, dynamic>{
      'token': instance.token,
      'expires': instance.expires,
    };
