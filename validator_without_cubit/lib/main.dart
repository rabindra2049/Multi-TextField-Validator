import 'package:flutter/material.dart';
import 'package:validator_without_cubit/screen/widget_validtor_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widget Validator Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WidgetValidatorTest(),
    );
  }
}
