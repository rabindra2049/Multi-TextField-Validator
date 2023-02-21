import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validator_without_cubit/validator/widget_validator.dart';
import 'package:validator_without_cubit/validator/widget_validator_listener.dart';

class WidgetValidatorTest extends StatefulWidget {
  const WidgetValidatorTest({Key? key}) : super(key: key);

  @override
  State<WidgetValidatorTest> createState() => _WidgetValidatorState();
}

class _WidgetValidatorState extends State<WidgetValidatorTest>
    implements WidgetValidatorListener {
  final formKey = GlobalKey<FormState>();
  final lastNameKey = GlobalKey<FormState>();
  late WidgetValidator _widgetValidator;

  @override
  void initState() {
    super.initState();
    _widgetValidator = WidgetValidator(this);
    _widgetValidator.registerWidgetForValidation(formKey);
    _widgetValidator.registerWidgetForValidation(lastNameKey);
  }

  String name = "";
  String errorTextvalue = '';
  String errorTextvalue1 = '';
  bool isValidate = false;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.04),
              TextFormField(
                key: formKey,
                decoration: InputDecoration(
                    labelText: "Enter your first name*",
                    errorText: errorTextvalue.isEmpty
                        ? null
                        : "Enter Correct first name"),
                onChanged: (value) {
                  setState(() {
                    if (RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      errorTextvalue = '';
                      _widgetValidator.updateWidgetState(formKey, true);
                    } else {
                      _widgetValidator.updateWidgetState(formKey, false);
                      errorTextvalue = value;
                    }
                  });
                },
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                key: lastNameKey,
                decoration: InputDecoration(
                    labelText: "Enter your last name*",
                    errorText: errorTextvalue1.isEmpty
                        ? null
                        : "Enter Correct last name"),
                onChanged: (value) {
                  setState(() {
                    if (RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      errorTextvalue1 = '';
                      _widgetValidator.updateWidgetState(lastNameKey, true);
                    } else {
                      _widgetValidator.updateWidgetState(lastNameKey, false);
                      errorTextvalue1 = value;
                    }
                  });
                },
              ),
              SizedBox(height: height * 0.04),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter your address",
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: isValidate ? Colors.red : Colors.grey,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }

  @override
  void onAllWidgetValidationFailed() {
    setState(() {
      isValidate = false;
    });
  }

  @override
  void onAllWidgetValidationSuccess() {
    setState(() {
      isValidate = true;
    });
  }
}
