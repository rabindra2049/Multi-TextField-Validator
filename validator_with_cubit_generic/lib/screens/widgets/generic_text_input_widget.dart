import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/extension/number_extensions.dart';
import 'package:validator_with_cubit_generic/validator/models/generic_text_input_field.dart';
import 'package:validator_with_cubit_generic/screens/widgets/text_input.dart';

class GenericTextInputWidget extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final GenericFormFieldCubit<FormzInput> cubit;
  final String? errorText;
  final String? requiredText;
  final String label;
  final String? helperText;
  final String paramKey;
  final String? minValue;
  final String? maxValue;
  final FocusNode? focusNode;
  final String? prefixText;
  final TextInputType? keyboardType;
  final bool isDropDownDataFilled;
  final bool shouldEnableGesture;
  final Widget? suffixIcon;
  final GenericTextInputType inputType;
  final int maxLength;

  GenericTextInputWidget(this.cubit,
      {super.key,
      required this.paramKey,
      this.errorText,
      this.requiredText,
      this.helperText,
      this.keyboardType = TextInputType.text,
      this.inputType = GenericTextInputType.GENERIC,
      required this.label,
      this.minValue = '',
      this.isDropDownDataFilled = false,
      this.shouldEnableGesture = true,
      this.maxValue = '',
      this.focusNode,
      this.prefixText,
      this.suffixIcon,
      this.maxLength = 100});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields[paramKey] != current.formFields[paramKey] ||
          previous.formFields["$paramKey-prefix"] !=
              current.formFields["$paramKey-prefix"],
      builder: (context, state) {
        final currentValue = state.formFields[paramKey]?.value;
        final currentSelection = _textEditingController.selection;
        final editValue = TextEditingValue(
          text: currentValue,
          selection: currentSelection,
        );
        _textEditingController.value = editValue;
        _textEditingController.selection = TextSelection.fromPosition(
            TextPosition(offset: editValue.text.length));

        return Column(
          children: [
            TextInput(
              shouldEnableGesture: shouldEnableGesture,
              initialValue: isDropDownDataFilled
                  ? null
                  : state.formFields[paramKey]?.value,
              controller: isDropDownDataFilled ? _textEditingController : null,
              key: Key('${paramKey}_textField'),
              onChanged: (value) {
                var name = GenericTextInputField.custom(value,
                    errorMessage: errorText,
                    requiredMessage: requiredText,
                    minValue: minValue,
                    maxValue: maxValue,
                    textInputType: inputType);
                cubit.updateField(paramKey, name);
              },
              prefixText: (prefixText ?? "").isEmpty
                  ? state.formFields["$paramKey-prefix"]?.value
                  : prefixText,
              helperText: helperText,
              suffixIcon: suffixIcon,
              label: label,
              focusNode: focusNode,
              maxLength: maxLength,
              keyboardType: keyboardType,
              errorText:
                  (state.formFields[paramKey] as GenericTextInputField).invalid
                      ? (state.formFields[paramKey] as GenericTextInputField)
                          .getErrorMessage
                      : null,
            ),
            16.heightSizedBox,
          ],
        );
      },
    );
  }
}
