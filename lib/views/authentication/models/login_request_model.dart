import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oms/shared/typedef.dart';

part 'login_request_model.freezed.dart';
part 'login_request_model.g.dart';

@freezed
class LoginRequestModel with _$LoginRequestModel {
  factory LoginRequestModel({
    required String email,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(JSON json) =>
      _$LoginRequestModelFromJson(json);
}
