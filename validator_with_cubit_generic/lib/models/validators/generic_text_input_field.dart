import 'package:formz/formz.dart';

enum GenericTextInputValidationError { invalid, empty, isNull }

class GenericTextInputField
    extends FormzInput<String, GenericTextInputValidationError> {
  final String? errorMessage;
  final String? requiredMessage;
  final String? minValue;
  final String? maxValue;
  final GenericTextInputType? textInputType;

  const GenericTextInputField.pure([String value = ''])
      : errorMessage = '',
        requiredMessage = '',
        minValue = '',
        maxValue = '',
        textInputType = GenericTextInputType.GENERIC,
        super.pure(value);

  const GenericTextInputField.optional()
      : errorMessage = '',
        requiredMessage = '',
        minValue = '',
        maxValue = '',
        textInputType = GenericTextInputType.GENERIC,
        super.pure(" ");

  const GenericTextInputField.dirty([String value = ''])
      : errorMessage = '',
        requiredMessage = '',
        minValue = '',
        maxValue = '',
        textInputType = GenericTextInputType.GENERIC,
        super.dirty(value);

  GenericTextInputField.custom(
    String value, {
    this.errorMessage,
    this.requiredMessage,
    this.minValue,
    this.maxValue,
    this.textInputType,
  }) : super.dirty(value);

  @override
  GenericTextInputValidationError? validator(String value) {
    switch (textInputType) {
      case GenericTextInputType.ADDRESS:
      case GenericTextInputType.GENERIC:
        if (value == null) return GenericTextInputValidationError.isNull;
        if (value.isEmpty) return GenericTextInputValidationError.empty;
        if (minValue != null &&
            minValue!.isNotEmpty &&
            value.length < int.parse(minValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        if (maxValue != null &&
            maxValue!.isNotEmpty &&
            value.length > int.parse(maxValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        return null;

      case GenericTextInputType.EMAIL:
        final emailRegex = RegExp(
          r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
        );
        if (value == null) return GenericTextInputValidationError.isNull;
        if (value.isEmpty) return GenericTextInputValidationError.empty;
        return emailRegex.hasMatch(value)
            ? null
            : GenericTextInputValidationError.invalid;

      case GenericTextInputType.USERNAME:
        if (value == null) return GenericTextInputValidationError.isNull;
        if (value.isEmpty) return GenericTextInputValidationError.empty;
        if (minValue != null &&
            minValue!.isNotEmpty &&
            value.length < int.parse(minValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        if (maxValue != null &&
            maxValue!.isNotEmpty &&
            value.length > int.parse(maxValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        return null;

      case GenericTextInputType.OPTIONAL:
        return null;

      case GenericTextInputType.AMOUNT:
        if (value == null) return GenericTextInputValidationError.isNull;
        if (value.isEmpty) return GenericTextInputValidationError.empty;
        if (minValue != null &&
            minValue!.isNotEmpty && value != null && double.tryParse(value)! < int.parse(minValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        if (maxValue != null &&
            maxValue!.isNotEmpty &&
            double.tryParse(value)! > int.parse(maxValue!)) {
          return GenericTextInputValidationError.invalid;
        }
        return null;

      default:
        return null;
    }
  }
}

extension GenericTextInputErrorMessageExtension on GenericTextInputField {
  String? get getErrorMessage {
    if (error == GenericTextInputValidationError.isNull) return null;
    if (error == GenericTextInputValidationError.invalid) return errorMessage;
    return error == GenericTextInputValidationError.empty
        ? requiredMessage
        : null;
  }
}

enum GenericTextInputType {
  ADDRESS,
  OPTIONAL,
  EMAIL,
  USERNAME,
  PASSWORD,
  AMOUNT,
  GENERIC,
}
