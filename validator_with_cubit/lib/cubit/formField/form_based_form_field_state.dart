import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:validator_with_cubit/validator/models/email_input_field.dart';
import 'package:validator_with_cubit/validator/models/generic_input_field.dart';
import 'package:validator_with_cubit/validator/models/username_input_field.dart';

part 'form_based_form_field_state.freezed.dart';

@freezed
@immutable
class FormBasedFormFieldState with _$FormBasedFormFieldState {
  const factory FormBasedFormFieldState({
    @Default(UserNameInputField.pure()) UserNameInputField name,
    @Default(EmailInputField.pure()) EmailInputField email,
    @Default(GenericInputField.pure()) GenericInputField mobileNumber,
    @Default('') String remarks,
    @Default(FormzStatus.pure) FormzStatus status,
  }) = _FormBasedFormFieldState;
}
