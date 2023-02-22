// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_based_form_field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormBasedFormFieldState {
  UserNameInputField get name => throw _privateConstructorUsedError;
  EmailInputField get email => throw _privateConstructorUsedError;
  GenericInputField get mobileNumber => throw _privateConstructorUsedError;
  String get remarks => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormBasedFormFieldStateCopyWith<FormBasedFormFieldState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormBasedFormFieldStateCopyWith<$Res> {
  factory $FormBasedFormFieldStateCopyWith(FormBasedFormFieldState value,
          $Res Function(FormBasedFormFieldState) then) =
      _$FormBasedFormFieldStateCopyWithImpl<$Res, FormBasedFormFieldState>;
  @useResult
  $Res call(
      {UserNameInputField name,
      EmailInputField email,
      GenericInputField mobileNumber,
      String remarks,
      FormzStatus status});
}

/// @nodoc
class _$FormBasedFormFieldStateCopyWithImpl<$Res,
        $Val extends FormBasedFormFieldState>
    implements $FormBasedFormFieldStateCopyWith<$Res> {
  _$FormBasedFormFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? mobileNumber = null,
    Object? remarks = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as UserNameInputField,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInputField,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as GenericInputField,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormBasedFormFieldStateCopyWith<$Res>
    implements $FormBasedFormFieldStateCopyWith<$Res> {
  factory _$$_FormBasedFormFieldStateCopyWith(_$_FormBasedFormFieldState value,
          $Res Function(_$_FormBasedFormFieldState) then) =
      __$$_FormBasedFormFieldStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserNameInputField name,
      EmailInputField email,
      GenericInputField mobileNumber,
      String remarks,
      FormzStatus status});
}

/// @nodoc
class __$$_FormBasedFormFieldStateCopyWithImpl<$Res>
    extends _$FormBasedFormFieldStateCopyWithImpl<$Res,
        _$_FormBasedFormFieldState>
    implements _$$_FormBasedFormFieldStateCopyWith<$Res> {
  __$$_FormBasedFormFieldStateCopyWithImpl(_$_FormBasedFormFieldState _value,
      $Res Function(_$_FormBasedFormFieldState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? email = null,
    Object? mobileNumber = null,
    Object? remarks = null,
    Object? status = null,
  }) {
    return _then(_$_FormBasedFormFieldState(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as UserNameInputField,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailInputField,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as GenericInputField,
      remarks: null == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_FormBasedFormFieldState implements _FormBasedFormFieldState {
  const _$_FormBasedFormFieldState(
      {this.name = const UserNameInputField.pure(),
      this.email = const EmailInputField.pure(),
      this.mobileNumber = const GenericInputField.pure(),
      this.remarks = '',
      this.status = FormzStatus.pure});

  @override
  @JsonKey()
  final UserNameInputField name;
  @override
  @JsonKey()
  final EmailInputField email;
  @override
  @JsonKey()
  final GenericInputField mobileNumber;
  @override
  @JsonKey()
  final String remarks;
  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'FormBasedFormFieldState(name: $name, email: $email, mobileNumber: $mobileNumber, remarks: $remarks, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormBasedFormFieldState &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, email, mobileNumber, remarks, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormBasedFormFieldStateCopyWith<_$_FormBasedFormFieldState>
      get copyWith =>
          __$$_FormBasedFormFieldStateCopyWithImpl<_$_FormBasedFormFieldState>(
              this, _$identity);
}

abstract class _FormBasedFormFieldState implements FormBasedFormFieldState {
  const factory _FormBasedFormFieldState(
      {final UserNameInputField name,
      final EmailInputField email,
      final GenericInputField mobileNumber,
      final String remarks,
      final FormzStatus status}) = _$_FormBasedFormFieldState;

  @override
  UserNameInputField get name;
  @override
  EmailInputField get email;
  @override
  GenericInputField get mobileNumber;
  @override
  String get remarks;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_FormBasedFormFieldStateCopyWith<_$_FormBasedFormFieldState>
      get copyWith => throw _privateConstructorUsedError;
}
