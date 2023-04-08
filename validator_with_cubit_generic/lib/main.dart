import 'package:flutter/material.dart';
import 'package:validator_with_cubit_generic/di.dart';
import 'package:validator_with_cubit_generic/screens/form_based_home_screen.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const FormBasedHomeScreen(),
    );
  }
}
