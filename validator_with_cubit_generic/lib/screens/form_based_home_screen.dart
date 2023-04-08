import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:validator_with_cubit_generic/cubit/generic_form_field_cubit.dart';
import 'package:validator_with_cubit_generic/di.dart';
import 'form_field_page.dart';

class FormBasedHomeScreen extends StatelessWidget {
  const FormBasedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GenericFormFieldCubit<FormzInput>>(),
      child: const FormFieldPage(),
    );
  }
}
