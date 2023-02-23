import 'package:formz/formz.dart';

enum OptionalFieldInputValidationError { isNull }

class OptionalInputField
    extends FormzInput<String, OptionalFieldInputValidationError> {
  const OptionalInputField.pure([String value = '']) : super.pure(value);

  const OptionalInputField.dirty([String value = '']) : super.dirty(value);

  @override
  OptionalFieldInputValidationError? validator(String value) {
    return OptionalFieldInputValidationError.isNull;
  }
}

extension OptionalFieldInputErrorMessageExtension on OptionalInputField {
  String? get getErrorMessage {
    if (error == OptionalFieldInputValidationError.isNull) return null;
    return null;
  }
}
