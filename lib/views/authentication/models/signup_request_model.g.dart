// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignupRequestModel _$$_SignupRequestModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignupRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
      fullname: json['fullname'] as String,
    );

Map<String, dynamic> _$$_SignupRequestModelToJson(
        _$_SignupRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'fullname': instance.fullname,
    };
