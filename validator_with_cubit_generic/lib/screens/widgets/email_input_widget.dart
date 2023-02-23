import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/validator/models/email_input_field.dart';

class EmailInput extends StatelessWidget {
  final GenericFormFieldCubit<FormzInput> cubit;
  final String paramKey;

  const EmailInput(this.cubit, {super.key, required this.paramKey});

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
