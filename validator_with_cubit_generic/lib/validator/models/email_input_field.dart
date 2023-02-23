import 'package:formz/formz.dart';

/// Enum for email validation errors
enum EmailValidationError {
  /// Invalid email format
  invalid,

  /// Email value is empty
  empty,

  /// Email value is null
  isNull
}

/// Class for validating email input
/// FormzInput with two type arguments: @param String and @param EmailValidationError
/// Expects to receive a string input to validate, and will either return null (if the input is valid) or
/// an instance of EmailValidationError (if the input is invalid).
class EmailInputField extends FormzInput<String, EmailValidationError> {
  /// Constructor for a pristine email input. A pristine input is a new input that
  /// has not been modified. In Formz, it is represented by an input with the FormzInputStatus.pure status.
  const EmailInputField.pure([String value = '']) : super.pure(value);

  /// Constructor for a dirty email input. A dirty input is an input that has been
  /// modified. In Formz, it is represented by an input with the FormzInputStatus.dirty status.
  const EmailInputField.dirty([String value = '']) : super.dirty(value);

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  /// Validator function to check whether the given email input is valid or not.
  /// Returns null if the input is valid, otherwise returns the corresponding
  /// EmailValidationError.
  @override
  EmailValidationError? validator(String value) {
    if (value == null) return EmailValidationError.isNull;
    if (value.isEmpty) return EmailValidationError.empty;
    return _emailRegex.hasMatch(value) ? null : EmailValidationError.invalid;
  }
}

/// Extension for displaying error message for email validation errors
extension EmailErrorMessageExtension on EmailInputField {
  String? get getErrorMessage {
    if (error == EmailValidationError.isNull) return null;
    if (error == EmailValidationError.invalid) return 'Email Invalid';
    return error == EmailValidationError.empty ? 'Required field' : null;
  }
}
