import 'package:formz/formz.dart';

enum TextViewInputValidationError { invalid, empty, isNull }

class GenericInputField extends FormzInput<String, TextViewInputValidationError> {
  const GenericInputField.pure([String value = '']) : super.pure(value);

  const GenericInputField.dirty([String value = '']) : super.dirty(value);

  @override
  TextViewInputValidationError? validator(String value) {
    if (value == null) return TextViewInputValidationError.isNull;
    if (value.isEmpty) return TextViewInputValidationError.empty;
  }
}

extension TextViewInputErrorMessageExtension on GenericInputField {
  String? get getErrorMessage {
    if (error == TextViewInputValidationError.isNull) return null;
    return error == TextViewInputValidationError.empty
        ? 'Required field'
        : null;
  }
}
