// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SignupResponseModel _$$_SignupResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_SignupResponseModel(
      message: json['message'] as String? ?? "",
      success: json['success'] as bool? ?? false,
    );

Map<String, dynamic> _$$_SignupResponseModelToJson(
        _$_SignupResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'success': instance.success,
    };
