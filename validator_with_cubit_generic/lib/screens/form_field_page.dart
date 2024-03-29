import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/form/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/form/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/di.dart';
import 'package:validator_with_cubit_generic/helper/form_field_key.dart';
import 'package:validator_with_cubit_generic/models/validators/generic_text_input_field.dart';
import 'package:validator_with_cubit_generic/screens/form_field_details_page.dart';
import 'package:validator_with_cubit_generic/screens/widgets/generic_text_input_widget.dart';

import 'widgets/generic_floating_button.dart';

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
    cubit = getIt<GenericFormFieldCubit<FormzInput>>();
    updateField(cubit);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Generic Form"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: _buildFormFields(cubit),
          ),
          floatingActionButton: GenericFloatingButton(
            context,
            "proceed_button",
            onPressed: onPressed,
          )),
    );
  }
}

void updateField(GenericFormFieldCubit<FormzInput> cubit) {
  cubit.updateField(
      FormFieldKey.address.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.email.name, const GenericTextInputField.pure());

  cubit.updateField(FormFieldKey.name.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.remarks.name, const GenericTextInputField.optional());
}

onPressed(BuildContext context,
    GenericFormFieldState<FormzInput<dynamic, dynamic>> state) {
  state.formFields.forEach((key, v) {
    print("KEY : $key, Value : ${v.value}");
  });
  if (state.status.isValid) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider(
          create: (context) => getIt<GenericFormFieldCubit<FormzInput>>(),
          child: const FormFieldDetailsPage(),
        ),
      ),
    );
  }
}

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
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.name.name,
        errorText: "Enter full name",
        requiredText: "Enter full name",
        label: "Full Name",
        helperText: "Enter full name",
        inputType: GenericTextInputType.GENERIC,
      ),
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.remarks.name,
        errorText: "Enter remarks",
        requiredText: "Enter remarks",
        label: "Remarks",
        helperText: "Enter remarks(Optional)",
        inputType: GenericTextInputType.OPTIONAL,
      ),
    ],
  );
}
