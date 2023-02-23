import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/validator/models/email_input_field.dart';
import 'package:validator_with_cubit_generic/validator/models/optional_input_field.dart';
import 'package:validator_with_cubit_generic/validator/models/username_input_field.dart';

import 'widgets/email_input_widget.dart';

final _formFields = <String, FormzInput>{
  'address': const UserNameInputField.pure(),
  'remarks': const OptionalInputField.pure(),
  'email': const EmailInputField.pure(),
};
final _cubit = GenericFormFieldCubit<FormzInput>(_formFields);

class FormFieldPage extends StatelessWidget {
  const FormFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        body: _buildFormFields(),
        floatingActionButton: _SubmitButton(),
      ),
    );
  }
}

Widget _buildFormFields() {
  return Column(
    children: [
      _AddressInput(),
      const SizedBox(
        height: 10,
      ),
      EmailInput(
        _cubit,
        paramKey: 'email',
      ),
      const SizedBox(
        height: 10,
      ),
      _RemarksInput()
    ],
  );
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      //buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return FloatingActionButton(
          key: const Key('personalInfoForm_submitButton_elevatedButton'),
          backgroundColor: state.status.isValidated ? Colors.red : Colors.grey,
          onPressed: () {
            state.formFields.forEach((key, v) {
              print("KEY : $key, Value : ${v.value}");
            });
          },
          child: const Icon(Icons.arrow_forward),
        );
      },
    );
  }
}

class _RemarksInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields['remarks'] != current.formFields['remarks'],
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            print("ON TAP");
            _cubit.updateField('address', UserNameInputField.custom("Hello"));
          },
          child: TextField(
            enabled: false,
            readOnly: true,
            key: const Key("personalInfoForm_remarksInput_textField"),
            onChanged: (value) {
              final name = OptionalInputField.dirty(value);
              _cubit.updateField('remarks', name);
            },
            decoration: const InputDecoration(
              labelText: 'Select Data',
              suffixIcon: Icon(Icons.arrow_drop_down)
            ),
          ),
        );
      },
    );
  }
}

class _AddressInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields['address'] != current.formFields['address'],
      builder: (context, state) {
        return TextField(
          key: const Key('personalInfoForm_addressInput_textField'),
          onChanged: (value) {
            final name = UserNameInputField.custom(value,
                errorMessage: 'Please enter a address',
                requiredMessage: 'This field is required field',
                minValue: '5',
                maxValue: '20');
            _cubit.updateField('address', name);
          },
          decoration: InputDecoration(
            labelText: 'Address',
            errorText:
                (state.formFields['address'] as UserNameInputField).invalid
                    ? (state.formFields['address'] as UserNameInputField)
                        .getErrorMessage
                    : null,
          ),
        );
      },
    );
  }
}
