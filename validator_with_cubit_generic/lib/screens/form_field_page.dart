import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/di.dart';
import 'package:validator_with_cubit_generic/extension/number_extensions.dart';
import 'package:validator_with_cubit_generic/helper/form_field_key.dart';
import 'package:validator_with_cubit_generic/screens/widgets/generic_text_input_widget.dart';
import 'package:validator_with_cubit_generic/validator/models/email_input_field.dart';
import 'package:validator_with_cubit_generic/validator/models/generic_text_input_field.dart';
import 'package:validator_with_cubit_generic/validator/models/optional_input_field.dart';
import 'package:validator_with_cubit_generic/validator/models/username_input_field.dart';

import 'widgets/email_input_widget.dart';
import 'widgets/generic_floating_button.dart';

final _formFields = <String, FormzInput>{
  'address': const UserNameInputField.pure(),
  'remarks': const OptionalInputField.pure(),
  'email': const EmailInputField.pure(),
};
final _cubit = GenericFormFieldCubit<FormzInput>(_formFields);

class FormFieldPage extends StatefulWidget {
  const FormFieldPage({Key? key}) : super(key: key);

  @override
  State<FormFieldPage> createState() => _FormFieldPageState();
}

class _FormFieldPageState extends State<FormFieldPage> {
  late GenericFormFieldCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<GenericFormFieldCubit>(context);
    updateField(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Generic Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: _buildFormFields(cubit),
        ),
        floatingActionButton: GenericFloatingButton(
          context,
          "gme_pay_proceed",
          onPressed: onPressed,
        ));
  }
}

void updateField(GenericFormFieldCubit<FormzInput> cubit) {
  cubit.updateField(
      FormFieldKey.address.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.email.name, const GenericTextInputField.pure());
}

onPressed(BuildContext context,
    GenericFormFieldState<FormzInput<dynamic, dynamic>> state) {}

Widget _buildFormFields(GenericFormFieldCubit<FormzInput> cubit) {
  return Column(
    children: [
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.address.name,
        errorText: "Enter address",
        requiredText: "Enter address",
        label: "Address",
        helperText: "Enter address",
        inputType: GenericTextInputType.GENERIC,
      ),
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.email.name,
        errorText: "Enter email",
        requiredText: "Enter email",
        label: "Email",
        helperText: "Enter email",
        inputType: GenericTextInputType.EMAIL,
      ),
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
            _cubit.updateField('address', UserNameInputField.custom("Hello"));
          },
          child: TextFormField(
            enabled: false,
            readOnly: true,
            key: const Key("personalInfoForm_remarksInput_textField"),
            onChanged: (value) {
              final name = OptionalInputField.dirty(value);
              _cubit.updateField('remarks', name);
            },
            decoration: const InputDecoration(
                labelText: 'Select Data',
                helperText: 'Clicking on this will set data on Address field',
                suffixIcon: Icon(Icons.arrow_drop_down)),
          ),
        );
      },
    );
  }
}

class _AddressInput extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericFormFieldCubit, GenericFormFieldState>(
      buildWhen: (previous, current) =>
          previous.formFields['address'] != current.formFields['address'],
      builder: (context, state) {
        final currentValue = state.formFields['address']?.value;
        TextSelection previousSelection = _textEditingController.selection;

        final editValue = TextEditingValue(
          text: currentValue,
          selection: previousSelection,
        );
        _textEditingController.value = editValue;
        return TextField(
          controller: _textEditingController,
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
