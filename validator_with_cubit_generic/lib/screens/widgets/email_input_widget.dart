import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:imepay_agent/common/validator/cubit/generic_form_field_cubit.dart';
import 'package:imepay_agent/common/validator/cubit/generic_form_field_state.dart';
import 'package:imepay_agent/common/validator/models/email_input_field.dart';

class EmailInput extends StatelessWidget {
  final GenericFormFieldCubit<FormzInput> cubit;
  final String? errorMessage;
  final String? requiredMessage;
  final String paramKey;

  const EmailInput(this.cubit,
      {super.key,
      required this.paramKey,
      this.errorMessage,
      this.requiredMessage});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields[paramKey] != current.formFields[paramKey],
      builder: (context, state) {
        return TextField(
          key: Key('${paramKey}_textField'),
          onChanged: (value) {
            final name = EmailInputField.dirty(value);
            cubit.updateField(paramKey, name);
          },
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: (state.formFields[paramKey] as EmailInputField).invalid
                ? (state.formFields[paramKey] as EmailInputField)
                    .getErrorMessage
                : null,
          ),
        );
      },
    );
  }
}
