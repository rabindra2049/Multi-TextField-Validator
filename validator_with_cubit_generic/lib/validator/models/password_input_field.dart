import 'package:formz/formz.dart';

enum PasswordValidationError { invalid, empty, isNull }

class PasswordInputField extends FormzInput<String, PasswordValidationError> {
  const PasswordInputField.pure([String value = '']) : super.pure(value);

  const PasswordInputField.dirty([String value = '']) : super.dirty(value);

  @override
  PasswordValidationError? validator(String value) {
    if (value == null) return PasswordValidationError.isNull;
    if (value.isEmpty) return PasswordValidationError.empty;
    return value.length >= 6 ? null : PasswordValidationError.invalid;
  }
}

extension PasswordErrorMessageExtension on PasswordInputField {
  String? get getErrorMessage {
    if (error == PasswordValidationError.isNull) return null;
    if (error == PasswordValidationError.invalid) {
      return 'Password too short';
    }
    return error == PasswordValidationError.empty ? 'Required field' : null;
  }
}
