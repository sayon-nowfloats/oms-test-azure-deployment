// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ForgotPasswordRequestModel _$ForgotPasswordRequestModelFromJson(
    Map<String, dynamic> json) {
  return _ForgotPasswordRequestModel.fromJson(json);
}

/// @nodoc
mixin _$ForgotPasswordRequestModel {
  String get email => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ForgotPasswordRequestModelCopyWith<ForgotPasswordRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordRequestModelCopyWith<$Res> {
  factory $ForgotPasswordRequestModelCopyWith(ForgotPasswordRequestModel value,
          $Res Function(ForgotPasswordRequestModel) then) =
      _$ForgotPasswordRequestModelCopyWithImpl<$Res,
          ForgotPasswordRequestModel>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordRequestModelCopyWithImpl<$Res,
        $Val extends ForgotPasswordRequestModel>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  _$ForgotPasswordRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordRequestModelCopyWith<$Res>
    implements $ForgotPasswordRequestModelCopyWith<$Res> {
  factory _$$_ForgotPasswordRequestModelCopyWith(
          _$_ForgotPasswordRequestModel value,
          $Res Function(_$_ForgotPasswordRequestModel) then) =
      __$$_ForgotPasswordRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$_ForgotPasswordRequestModelCopyWithImpl<$Res>
    extends _$ForgotPasswordRequestModelCopyWithImpl<$Res,
        _$_ForgotPasswordRequestModel>
    implements _$$_ForgotPasswordRequestModelCopyWith<$Res> {
  __$$_ForgotPasswordRequestModelCopyWithImpl(
      _$_ForgotPasswordRequestModel _value,
      $Res Function(_$_ForgotPasswordRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$_ForgotPasswordRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ForgotPasswordRequestModel implements _ForgotPasswordRequestModel {
  _$_ForgotPasswordRequestModel({required this.email});

  factory _$_ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_ForgotPasswordRequestModelFromJson(json);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordRequestModel(email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordRequestModel &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordRequestModelCopyWith<_$_ForgotPasswordRequestModel>
      get copyWith => __$$_ForgotPasswordRequestModelCopyWithImpl<
          _$_ForgotPasswordRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ForgotPasswordRequestModelToJson(
      this,
    );
  }
}

abstract class _ForgotPasswordRequestModel
    implements ForgotPasswordRequestModel {
  factory _ForgotPasswordRequestModel({required final String email}) =
      _$_ForgotPasswordRequestModel;

  factory _ForgotPasswordRequestModel.fromJson(Map<String, dynamic> json) =
      _$_ForgotPasswordRequestModel.fromJson;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordRequestModelCopyWith<_$_ForgotPasswordRequestModel>
      get copyWith => throw _privateConstructorUsedError;
}
