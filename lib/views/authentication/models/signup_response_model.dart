import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oms/shared/typedef.dart';

part 'signup_response_model.freezed.dart';
part 'signup_response_model.g.dart';

@freezed
class SignupResponseModel with _$SignupResponseModel {
  factory SignupResponseModel({
    @Default("") String message,
    @Default(false) bool success,
  }) = _SignupResponseModel;

  factory SignupResponseModel.fromJson(JSON json) =>
      _$SignupResponseModelFromJson(json);
}
