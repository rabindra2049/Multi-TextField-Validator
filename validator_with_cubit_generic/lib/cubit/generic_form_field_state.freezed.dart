// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_form_field_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GenericFormFieldState<T extends FormzInput<dynamic, dynamic>> {
  Map<String, T> get formFields => throw _privateConstructorUsedError;
  FormzStatus get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GenericFormFieldStateCopyWith<T, GenericFormFieldState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericFormFieldStateCopyWith<
    T extends FormzInput<dynamic, dynamic>, $Res> {
  factory $GenericFormFieldStateCopyWith(GenericFormFieldState<T> value,
          $Res Function(GenericFormFieldState<T>) then) =
      _$GenericFormFieldStateCopyWithImpl<T, $Res, GenericFormFieldState<T>>;
  @useResult
  $Res call({Map<String, T> formFields, FormzStatus status});
}

/// @nodoc
class _$GenericFormFieldStateCopyWithImpl<
        T extends FormzInput<dynamic, dynamic>,
        $Res,
        $Val extends GenericFormFieldState<T>>
    implements $GenericFormFieldStateCopyWith<T, $Res> {
  _$GenericFormFieldStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formFields = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      formFields: null == formFields
          ? _value.formFields
          : formFields // ignore: cast_nullable_to_non_nullable
              as Map<String, T>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenericFormFieldStateCopyWith<
    T extends FormzInput<dynamic, dynamic>,
    $Res> implements $GenericFormFieldStateCopyWith<T, $Res> {
  factory _$$_GenericFormFieldStateCopyWith(_$_GenericFormFieldState<T> value,
          $Res Function(_$_GenericFormFieldState<T>) then) =
      __$$_GenericFormFieldStateCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({Map<String, T> formFields, FormzStatus status});
}

/// @nodoc
class __$$_GenericFormFieldStateCopyWithImpl<
        T extends FormzInput<dynamic, dynamic>, $Res>
    extends _$GenericFormFieldStateCopyWithImpl<T, $Res,
        _$_GenericFormFieldState<T>>
    implements _$$_GenericFormFieldStateCopyWith<T, $Res> {
  __$$_GenericFormFieldStateCopyWithImpl(_$_GenericFormFieldState<T> _value,
      $Res Function(_$_GenericFormFieldState<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? formFields = null,
    Object? status = null,
  }) {
    return _then(_$_GenericFormFieldState<T>(
      formFields: null == formFields
          ? _value._formFields
          : formFields // ignore: cast_nullable_to_non_nullable
              as Map<String, T>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as FormzStatus,
    ));
  }
}

/// @nodoc

class _$_GenericFormFieldState<T extends FormzInput<dynamic, dynamic>>
    implements _GenericFormFieldState<T> {
  const _$_GenericFormFieldState(
      {required final Map<String, T> formFields,
      this.status = FormzStatus.pure})
      : _formFields = formFields;

  final Map<String, T> _formFields;
  @override
  Map<String, T> get formFields {
    if (_formFields is EqualUnmodifiableMapView) return _formFields;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formFields);
  }

  @override
  @JsonKey()
  final FormzStatus status;

  @override
  String toString() {
    return 'GenericFormFieldState<$T>(formFields: $formFields, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericFormFieldState<T> &&
            const DeepCollectionEquality()
                .equals(other._formFields, _formFields) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_formFields), status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericFormFieldStateCopyWith<T, _$_GenericFormFieldState<T>>
      get copyWith => __$$_GenericFormFieldStateCopyWithImpl<T,
          _$_GenericFormFieldState<T>>(this, _$identity);
}

abstract class _GenericFormFieldState<T extends FormzInput<dynamic, dynamic>>
    implements GenericFormFieldState<T> {
  const factory _GenericFormFieldState(
      {required final Map<String, T> formFields,
      final FormzStatus status}) = _$_GenericFormFieldState<T>;

  @override
  Map<String, T> get formFields;
  @override
  FormzStatus get status;
  @override
  @JsonKey(ignore: true)
  _$$_GenericFormFieldStateCopyWith<T, _$_GenericFormFieldState<T>>
      get copyWith => throw _privateConstructorUsedError;
}
