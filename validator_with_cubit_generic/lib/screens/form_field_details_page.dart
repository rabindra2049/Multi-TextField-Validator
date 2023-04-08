import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_state.dart';
import 'package:validator_with_cubit_generic/helper/form_field_key.dart';
import 'package:validator_with_cubit_generic/screens/widgets/generic_drop_down_widget.dart';
import 'package:validator_with_cubit_generic/screens/widgets/generic_text_input_widget.dart';
import 'package:validator_with_cubit_generic/validator/models/generic_text_input_field.dart';

import 'widgets/generic_floating_button.dart';

class FormFieldDetailsPage extends StatefulWidget {
  const FormFieldDetailsPage({Key? key}) : super(key: key);

  @override
  State<FormFieldDetailsPage> createState() => _FormFieldDetailsPageState();
}

class _FormFieldDetailsPageState extends State<FormFieldDetailsPage> {
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
          title: const Text("Generic Form Details"),
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
      FormFieldKey.relation.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.idType.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.issueDate.name, const GenericTextInputField.pure());

  cubit.updateField(
      FormFieldKey.expiryDate.name, const GenericTextInputField.pure());
}

onPressed(BuildContext context,
    GenericFormFieldState<FormzInput<dynamic, dynamic>> state) {
  state.formFields.forEach((key, v) {
    print("KEY : $key, Value : ${v.value}");
  });
}

Widget _buildFormFields(GenericFormFieldCubit<FormzInput> cubit) {
  return Column(
    children: [
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.relation.name,
        errorText: "Enter relation",
        requiredText: "Enter relation",
        label: "Relation",
        helperText: "Enter relation",
        inputType: GenericTextInputType.GENERIC,
      ),
      GenericDropDownWidget(
        onTap: () {},
        cubit,
        paramKey: FormFieldKey.idType.name,
        errorText: "Select ID type",
        requiredText: "Select ID type",
        label: "ID type",
        helperText: "Select ID type",
        inputType: GenericTextInputType.EMAIL,
      ),
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.issueDate.name,
        errorText: "Enter issue date",
        requiredText: "Enter issue date",
        label: "Issue Date",
        helperText: "Enter issue date",
        inputType: GenericTextInputType.GENERIC,
      ),
      GenericTextInputWidget(
        cubit,
        keyboardType: TextInputType.text,
        paramKey: FormFieldKey.expiryDate.name,
        errorText: "Enter expiry date",
        requiredText: "Enter expiry date",
        label: "Expiry Date",
        helperText: "Enter expiry date",
        inputType: GenericTextInputType.GENERIC,
      ),
    ],
  );
}
