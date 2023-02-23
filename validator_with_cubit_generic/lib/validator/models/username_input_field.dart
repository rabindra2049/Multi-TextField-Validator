import 'package:formz/formz.dart';

enum UserNameValidationError { invalid, empty, isNull }

class UserNameInputField extends FormzInput<String, UserNameValidationError> {
  final String? errorMessage;
  final String? requiredMessage;
  final String? minValue;
  final String? maxValue;

  const UserNameInputField.pure([String value = ''])
      : errorMessage = '',
        requiredMessage = '',
        minValue = '',
        maxValue = '',
        super.pure(value);

  const UserNameInputField.dirty([String value = ''])
      : errorMessage = '',
        requiredMessage = '',
        minValue = '',
        maxValue = '',
        super.dirty(value);

  UserNameInputField.custom(
    String value, {
    this.errorMessage,
    this.requiredMessage,
    this.minValue,
    this.maxValue,
  }) : super.dirty(value);

  @override
  UserNameValidationError? validator(String value) {
    if (value == null) return UserNameValidationError.isNull;
    if (value.isEmpty) return UserNameValidationError.empty;
    if (minValue != null && value.length < int.parse(minValue!)) {
      return UserNameValidationError.invalid;
    }
    if (maxValue != null && value.length > int.parse(maxValue!)) {
      return UserNameValidationError.invalid;
    }
  }
}

extension NameInputErrorMessageExtension on UserNameInputField {
  String? get getErrorMessage {
    if (error == UserNameValidationError.isNull) return null;
    if (error == UserNameValidationError.invalid) return errorMessage;
    return error == UserNameValidationError.empty ? requiredMessage : null;
  }
}
