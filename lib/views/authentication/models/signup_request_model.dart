import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oms/shared/typedef.dart';

part 'signup_request_model.freezed.dart';
part 'signup_request_model.g.dart';

@freezed
class SignupRequestModel with _$SignupRequestModel {
  factory SignupRequestModel({
    required String email,
    required String password,
    required String fullname,
  }) = _SignupRequestModel;

  factory SignupRequestModel.fromJson(JSON json) =>
      _$SignupRequestModelFromJson(json);
}
