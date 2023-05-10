// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) {
  return _SignupRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SignupRequestModel {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get fullname => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupRequestModelCopyWith<SignupRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupRequestModelCopyWith<$Res> {
  factory $SignupRequestModelCopyWith(
          SignupRequestModel value, $Res Function(SignupRequestModel) then) =
      _$SignupRequestModelCopyWithImpl<$Res, SignupRequestModel>;
  @useResult
  $Res call({String email, String password, String fullname});
}

/// @nodoc
class _$SignupRequestModelCopyWithImpl<$Res, $Val extends SignupRequestModel>
    implements $SignupRequestModelCopyWith<$Res> {
  _$SignupRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullname = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignupRequestModelCopyWith<$Res>
    implements $SignupRequestModelCopyWith<$Res> {
  factory _$$_SignupRequestModelCopyWith(_$_SignupRequestModel value,
          $Res Function(_$_SignupRequestModel) then) =
      __$$_SignupRequestModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password, String fullname});
}

/// @nodoc
class __$$_SignupRequestModelCopyWithImpl<$Res>
    extends _$SignupRequestModelCopyWithImpl<$Res, _$_SignupRequestModel>
    implements _$$_SignupRequestModelCopyWith<$Res> {
  __$$_SignupRequestModelCopyWithImpl(
      _$_SignupRequestModel _value, $Res Function(_$_SignupRequestModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? fullname = null,
  }) {
    return _then(_$_SignupRequestModel(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      fullname: null == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SignupRequestModel implements _SignupRequestModel {
  _$_SignupRequestModel(
      {required this.email, required this.password, required this.fullname});

  factory _$_SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$$_SignupRequestModelFromJson(json);

  @override
  final String email;
  @override
  final String password;
  @override
  final String fullname;

  @override
  String toString() {
    return 'SignupRequestModel(email: $email, password: $password, fullname: $fullname)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignupRequestModel &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, password, fullname);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignupRequestModelCopyWith<_$_SignupRequestModel> get copyWith =>
      __$$_SignupRequestModelCopyWithImpl<_$_SignupRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SignupRequestModelToJson(
      this,
    );
  }
}

abstract class _SignupRequestModel implements SignupRequestModel {
  factory _SignupRequestModel(
      {required final String email,
      required final String password,
      required final String fullname}) = _$_SignupRequestModel;

  factory _SignupRequestModel.fromJson(Map<String, dynamic> json) =
      _$_SignupRequestModel.fromJson;

  @override
  String get email;
  @override
  String get password;
  @override
  String get fullname;
  @override
  @JsonKey(ignore: true)
  _$$_SignupRequestModelCopyWith<_$_SignupRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}
