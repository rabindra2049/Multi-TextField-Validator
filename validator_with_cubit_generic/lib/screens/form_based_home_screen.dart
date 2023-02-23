import 'package:flutter/material.dart';
import 'form_field_page.dart';

class FormBasedHomeScreen extends StatelessWidget {
  const FormBasedHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: FormFieldPage(),
      ),
    );
  }
}
