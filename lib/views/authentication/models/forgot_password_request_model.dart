import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oms/shared/typedef.dart';

part 'forgot_password_request_model.freezed.dart';
part 'forgot_password_request_model.g.dart';

@freezed
class ForgotPasswordRequestModel with _$ForgotPasswordRequestModel {
  factory ForgotPasswordRequestModel({
    required String email,
  }) = _ForgotPasswordRequestModel;

  factory ForgotPasswordRequestModel.fromJson(JSON json) =>
      _$ForgotPasswordRequestModelFromJson(json);
}
