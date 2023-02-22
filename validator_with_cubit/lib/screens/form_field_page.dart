import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit/validator/models/email_input_field.dart';
import 'package:validator_with_cubit/validator/models/generic_input_field.dart';

import '../cubit/formField/form_based_form_field_cubit.dart';
import '../cubit/formField/form_based_form_field_state.dart';

class FormFieldPage extends StatelessWidget {
  const FormFieldPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: BlocListener<FormFieldCubit, FormBasedFormFieldState>(
        listener: (context, state) {},
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            _UserNameInput(),
            const SizedBox(
              height: 10,
            ),
            _FullNameInput(),
            const SizedBox(
              height: 20,
            ),
            _MobileNumberInput(),
            const SizedBox(
              height: 10,
            ),
            _RemarksInput(),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      floatingActionButton: _SubmitButton(),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFieldCubit, FormBasedFormFieldState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return TextField(
          key: const Key('personalInfoForm_nameInput_textField'),
          onChanged: (name) => context.read<FormFieldCubit>().updateUserName(
              name,
              errorMessage: 'Username must be between 5 to 20',
              requiredMessage: 'Enter a username',
              minValue: '5',
              maxValue: '20'),
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: state.name.invalid ? state.name.errorMessage : null,
          ),
        );
      },
    );
  }
}

class _MobileNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFieldCubit, FormBasedFormFieldState>(
      buildWhen: (previous, current) =>
          previous.mobileNumber != current.mobileNumber,
      builder: (context, state) {
        return TextField(
          key: const Key('personalInfoForm_mobileNUmberInput_textField'),
          onChanged: (name) =>
              context.read<FormFieldCubit>().updateMobileNumber(name),
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: state.mobileNumber.invalid
                ? state.mobileNumber.getErrorMessage
                : null,
          ),
        );
      },
    );
  }
}

class _RemarksInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFieldCubit, FormBasedFormFieldState>(
      builder: (context, state) {
        return TextField(
          key: const Key('personalInfoForm_mobileNUmberInput_textField'),
          onChanged: (name) =>
              context.read<FormFieldCubit>().remarksChanged(name),
          decoration: InputDecoration(
            labelText: 'Remarks',
          ),
        );
      },
    );
  }
}

class _FullNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFieldCubit, FormBasedFormFieldState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          key: const Key('personalInfoForm_fullnameInput_textField'),
          onChanged: (name) => context.read<FormFieldCubit>().updateEmail(name),
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: state.email.invalid ? state.email.getErrorMessage : null,
          ),
        );
      },
    );
  }
}

class _SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FormFieldCubit, FormBasedFormFieldState>(
      //buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return FloatingActionButton(
          key: const Key('personalInfoForm_submitButton_elevatedButton'),
          backgroundColor: state.status.isValidated ? Colors.red : Colors.grey,
          onPressed: () {
            print(state.name.value.toString());
            print(state.email.value.toString());
            print(state.mobileNumber.value.toString());
            print(state.remarks.toString());
          },
          child: const Icon(Icons.arrow_forward),
        );
      },
    );
  }
}
