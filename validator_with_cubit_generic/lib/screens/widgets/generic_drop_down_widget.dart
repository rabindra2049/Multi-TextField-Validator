import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/extension/number_extensions.dart';
import 'package:validator_with_cubit_generic/validator/models/generic_text_input_field.dart';
import 'package:validator_with_cubit_generic/screens/widgets/text_input.dart';

class GenericDropDownWidget extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final GenericFormFieldCubit<FormzInput> cubit;
  final String? errorText;
  final String? requiredText;
  final String label;
  final String? helperText;
  final String paramKey;
  final String? minValue;
  final String? maxValue;
  final bool shouldShowDropDownIcon;
  final bool isDropDownDataFilled;
  final GenericTextInputType inputType;
  final GestureTapCallback? onTap;

  GenericDropDownWidget(this.cubit,
      {super.key,
      required this.paramKey,
      this.errorText,
      this.onTap,
      this.requiredText,
      this.helperText,
      this.inputType = GenericTextInputType.GENERIC,
      required this.label,
      this.minValue = '',
      this.isDropDownDataFilled = false,
      this.maxValue = '',
      this.shouldShowDropDownIcon = true});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields[paramKey] != current.formFields[paramKey],
      builder: (context, state) {
        final currentValue = state.formFields[paramKey]?.value;
        final currentSelection = _textEditingController.selection;
        final editValue = TextEditingValue(
          text: currentValue,
          selection: currentSelection,
        );
        _textEditingController.value = editValue;
        return GestureDetector(
          onTap: onTap,
          child: Column(
            children: [
              TextInput(
                initialValue: isDropDownDataFilled
                    ? null
                    : state.formFields[paramKey]?.value,
                controller:
                    isDropDownDataFilled ? _textEditingController : null,
                shouldEnableGesture: false,
                shouldShowDropdownIcon: shouldShowDropDownIcon,
                key: Key('${paramKey}_textField'),
                maxLine: 1,
                onChanged: (value) {
                  var name = GenericTextInputField.custom(value,
                      errorMessage: errorText,
                      requiredMessage: requiredText,
                      minValue: minValue,
                      maxValue: maxValue,
                      textInputType: inputType);
                  cubit.updateField(paramKey, name);
                },
                helperText: helperText,
                label: label,
                errorText: (state.formFields[paramKey] as GenericTextInputField)
                        .invalid
                    ? (state.formFields[paramKey] as GenericTextInputField)
                        .getErrorMessage
                    : null,
              ),
              16.heightSizedBox,
            ],
          ),
        );
      },
    );
  }
}
