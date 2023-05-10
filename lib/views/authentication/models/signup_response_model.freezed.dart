// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) {
  return _SignupResponseModel.fromJson(json);
}

/// @nodoc
mixin _$SignupResponseModel {
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupResponseModelCopyWith<SignupResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupResponseModelCopyWith<$Res> {
  factory $SignupResponseModelCopyWith(
          SignupResponseModel value, $Res Function(SignupResponseModel) then) =
      _$SignupResponseModelCopyWithImpl<$Res, SignupResponseModel>;
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class _$SignupResponseModelCopyWithImpl<$Res, $Val extends SignupResponseModel>
    implements $SignupResponseModelCopyWith<$Res> {
  _$SignupResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupResponseModelCopyWith<$Res>
    implements $SignupResponseModelCopyWith<$Res> {
  factory _$$_SignupResponseModelCopyWith(_$_SignupResponseModel value,
          $Res Function(_$_SignupResponseModel) then) =
      __$$_SignupResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool success});
}

/// @nodoc
class __$$_SignupResponseModelCopyWithImpl<$Res>
    extends _$SignupResponseModelCopyWithImpl<$Res, _$_SignupResponseModel>
    implements _$$_SignupResponseModelCopyWith<$Res> {
  __$$_SignupResponseModelCopyWithImpl(_$_SignupResponseModel _value,
      $Res Function(_$_SignupResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$_SignupResponseModel(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignupResponseModel implements _SignupResponseModel {
  _$_SignupResponseModel({this.message = "", this.success = false});

  factory _$_SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignupResponseModelFromJson(json);

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final bool success;

  @override
  String toString() {
    return 'SignupResponseModel(message: $message, success: $success)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupResponseModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupResponseModelCopyWith<_$_SignupResponseModel> get copyWith =>
      __$$_SignupResponseModelCopyWithImpl<_$_SignupResponseModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignupResponseModelToJson(
      this,
    );
  }
}

abstract class _SignupResponseModel implements SignupResponseModel {
  factory _SignupResponseModel({final String message, final bool success}) =
      _$_SignupResponseModel;

  factory _SignupResponseModel.fromJson(Map<String, dynamic> json) =
      _$_SignupResponseModel.fromJson;

  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$_SignupResponseModelCopyWith<_$_SignupResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
