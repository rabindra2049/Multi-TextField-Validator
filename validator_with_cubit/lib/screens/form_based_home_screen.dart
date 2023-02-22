import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/formField/form_based_form_field_cubit.dart';
import 'form_field_page.dart';

class FormBasedHomeScreen extends StatelessWidget {
  const FormBasedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: BlocProvider(
          create: (context) => FormFieldCubit(),
          child: FormFieldPage(),
        ),
      ),
    );
  }
}
