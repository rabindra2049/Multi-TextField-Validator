import 'package:flutter/material.dart';

/// Extension methods on BuildContext
extension ContextExtension on BuildContext {
  ///Extension method on BuildContext to show a snackbar.
  ///It takes [snackBar] as the parameter of type SnackBar.
  ///If you are creating your own SnackBar, it's suggested to extend the class with SnackBar.
  ///Example to create your own SnackBar class:
  ///```
  ///class CustomSnackBar extends SnackBar {
  ///CustomSnackBar({
  ///  super.key,
  ///  required this.message,
  ///}) : super(
  ///        content: Text(message),
  ///         backgroundColor: Colors.black,
  ///      );
  ///  final String message;
  ///}
  ///```
  ///
  void showSnackBar(SnackBar snackBar) =>
      ScaffoldMessenger.of(this).showSnackBar(snackBar);

  ///Extension method on BuildContext to show a dialog.
  ///It takes [child] as the parameter of type Widget.
  ///
  void showNewDialog(Widget child) => showDialog(
    context: this,
    builder: (context) => child,
  );

  ///Extension method on BuildContext to get the screenHeight.
  ///It returns MediaQuery.of(context).size.height
  ///
  double get screenHeight => MediaQuery.of(this).size.height;

  ///Extension method on BuildContext to get the screenWidth.
  ///It returns MediaQuery.of(context).size.width
  ///
  double get screenWidth => MediaQuery.of(this).size.width;

  ///Extension method on BuildContext to get the screen aspectRatio.
  ///It returns MediaQuery.of(context).size.aspectRatio
  ///
  double get aspectRatio => MediaQuery.of(this).size.aspectRatio;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of mobile or not.
  ///It returns true if MediaQuery.of(context).size.width<650, else returns false.
  ///
  bool get isMobile => MediaQuery.of(this).size.width < 650;

  /// Extension method on BuildContext for getting padding
  /// return `EdgeInsets`
  ///
  EdgeInsets get padding => MediaQuery.of(this).padding;

  /// Extension method on BuildContext to for getting viewPadding
  /// return `EdgeInsets`
  ///
  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  /// Extension method on BuildContext for viewInsets
  /// returns `EdgeInsets`
  ///
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of tablet or not.
  ///It returns true if 1024>MediaQuery.of(context).size.width>=650, else returns false.
  ///
  bool get isTablet =>
      MediaQuery.of(this).size.width < 1024 &&
          MediaQuery.of(this).size.width >= 650;

  ///Extension method on BuildContext that returns whether the screen
  ///size is of desktop or not.
  ///It returns true if MediaQuery.of(context).size.width>=1024, else returns false.
  ///
  bool get isDesktop => MediaQuery.of(this).size.width >= 1024;
}